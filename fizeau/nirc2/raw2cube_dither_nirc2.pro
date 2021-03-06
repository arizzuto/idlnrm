; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
; %             program    raw2cube_dither_nirc2.pro                    %
; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
; This program is intended for use with NIRC2 speckle data.
;     It does steps beginning with raw data and outputting a cleaned cube
;     Assumes each frame is 2-dimensional (No data cubes)
;     This version assumes the frames sent are dithred (self-sky)
;
; Input Variables:
;     speck.  : vector containing the filename(s) of the source frames.
;     gain    : array containing gain (flat field).
;    datadir  : data directory 
; Output:
;    cube     : cleaned, centered data cube
;  headinfo   : structure of info stripped from header
;  fstats     : frame statistics (flux, sky bgr, xy speckle cloud etc)
;    flux     : array of fluxes for each frame for 10 different
;               aperture sizes.
;  dcube      : cleaned, centered sky cube.
; Options:
;    /destripe:     Dstripes the image (not implemented)
;     noskyfit:     Do not fit the sky background, just use supersky.
;  /setsquare :     Set this to trim non-square arrays back to square
;  saturation_flag: Returns number of pixels (NOT BAD PIXELS!) which are 
;		      are within 25% of TURNOVER SATURATION! (on AVERAGE per frame)
;		      This usually signals a recent NIRC crash.
;		    
; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
; History : Written                                           PGT  28Feb04
;Various cosmic ray changes...                                MJI  Jan-Apr07
; TO BE DONE!
;  Output dark frames of same size as data frames.

pro raw2cube_dither_nirc2,speck,datadir=datadir,  		$
        gain=gain,bad_pixels=bad_pixels,			$
	cube=cube,headinfo=hlog,fstats=fstats,flux=flux, 	$
	noskyfit=noskyfit,setsquare=setsquare,plotall=plotall,  $
        nocosmic = nocosmic,  dcube = dcube,  extn = extn, skies = skies,  skydir = skydir, $
        n_sigma = n_sigma,  dewarp = dewarp, starmask = starmask,  median_sub = median_sub,  $
  destripe = destripe, medsub_ssky=medsub_ssky, manclick=manclick, trust_object_name=trust_object_name

if (keyword_set(extn) eq 0) then extn =  '.fits.gz'
if (keyword_set(n_sigma) eq 0) then n_sigma =  5.7 ;An arbitrary number, but works well on test data.
cleanplot,/silent    ; Intialize Display Driver
if (keyword_set(datadir) eq 0) then datadir="./"
if (keyword_set(skydir) eq 0) then skydir=datadir
if (keyword_set(gain) eq 0) then gain=1.0
if (keyword_set(bad_pixels) eq 0) then bad_pixels=0
if (keyword_set(noskyfit) eq 0) then noskyfit=0
if (keyword_set(setsquare) eq 0) then setsquare=256
if (keyword_set(nocosmic) eq 0) then nocosmic = 0
if (keyword_set(dewarp) eq 0) then dewarp = 0
if (keyword_set(starmask) eq 0) then starmask = 0
if (keyword_set(skies) eq 0) then skies =  [-1]
if (keyword_set(destripe) eq 0) then destripe = 0
if (keyword_set(plotall) eq 0) then plotall = 0
if (keyword_set(medsub_ssky) eq 0) then medsub=0 else medsub=medsub_ssky
;______
; Initialization
;______

saturation_flag=long(0)
dimx=(size(gain))(1)
dimy=(size(gain))(2)
nframes=n_elements(speck)
skytrim=0.9              ;avoid chip edges when computing sky

; %%%%%  Ensure GAIN map has UNITY Gain for BAD Pixels 
; %%%%%   (important since we later divide by gain.)
gain(bad_pixels)=1.0

; %%%%%  Initialize variables 
proj_x=replicate(1,dimy)
proj_y=replicate(1,dimx)
xpeaks=[0] & ypeaks=[0] & tot_flx=[0.0] & pk_flx=[0.0] & sky_bg=[0.0]
meanxpk=0 & meanypk=0
flux=fltarr(10) ; initialize to accept 10-aperture photometry
han=hanning(dimx,dimy)
destripe_stats=fltarr(nframes,4)

; Define data structure to hold Header info 
s=replicate('',nframes) &  i=intarr(nframes) &  f=fltarr(nframes) &  d=dblarr(nframes)
;hlog_all={instrument:s,nax1:i,nax2:i,nax3:i,t_int:f,coadd:i,filter:s,slit:s,$ ;from headers
;        optic_cfg:s,lyot:s,grism:s,source_name:s,utc:s,                 $ 
;        date:s,jd:d,elevation:f,airmass:f,pa:f,del_pa:d,                $
;        ra:d,dec:d,equinox:f,  raoff, }
hlog_all = replicate(freud(''), nframes)

; %%%%%  Begin loop over data frames 
for i=0,nframes-1 do begin

; %%%%%  Read in speckle data
  if (n_elements(datadir) eq 1) then $
   filename=datadir+"n"+string(speck[i],format="(I4.4)")+extn $
  else filename=datadir[i]+"n"+string(speck[i],format="(I4.4)")+extn
  print,'Reading File: ',filename
  frame=float(reform(readfits(filename,head)))
  info=size(frame)
  headinfo=freud(head, trust_object_name=trust_object_name) 	; read header information

; %%%%%  Remove Bad Pixels (Preliminary Pass)
 ; frame=fix_bad_pixels(frame,bad=bad_pixels)
 
; %%%%% Accumulate frames
  if(i eq 0) then dcube=frame else dcube=[[[dcube]],[[frame]]]
  
; %%%%% Populate hlog_all_all data structure.
  hlog_all[i] =  headinfo

endfor                            ;%%%%% FINISH LOOP OVER ALL SPECKLE FRAMES 
; %%%%% Before ANYTHING else, we should remove bad pixels etc.
shifts =  fltarr(2, nframes)
for i = 0, nframes-1 do begin
 im=fix_bad_pixels(dcube[*, *, i],bad=bad_pixels)
 ;%%%%%  Remove cosmic rays or residual bad pixels (MJI) %%%%%
 if (nocosmic eq 0) then begin
    ;8-sigma is lots, but remember that we
                                ;have 65000 pixels, and this is a
                                ;first-pass
 im = sigma_filter_nirc2(im,8,n_sigma=n_sigma,/all,/mon)
 endif
;Quadrant-by-quadrant offset subtraction.
 if (keyword_set(median_sub) ne 0) then begin
  im[0:dimx/2-1, 0:dimy/2-1] -=  median(im[0:dimx/2-1, 0:dimy/2-1]) 
  im[dimx/2:dimx-1, 0:dimy/2-1] -=  median(im[dimx/2:dimx-1, 0:dimy/2-1])
  im[0:dimx/2-1, dimy/2:dimy-1] -=  median(im[0:dimx/2-1, dimy/2:dimy-1])
  im[dimx/2:dimx-1, dimy/2:dimy-1] -=  median(im[dimx/2:dimx-1, dimy/2:dimy-1])
 endif
 ;Destriping using quadrants.
 if (keyword_set(destripe) ne 0) then begin
  quads =  fltarr(dimx/2,  dimy/2,  4)
  quads[*, *, 0] = -im[0:dimx/2-1, 0:dimy/2-1]
  quads[*, *, 1] = -reverse(im[dimx/2:dimx-1, 0:dimy/2-1], 1)
  quads[*, *, 2] = -reverse(im[0:dimx/2-1, dimy/2:dimy-1], 2)
  quads[*, *, 3] = -reverse(reverse(im[dimx/2:dimx-1, dimy/2:dimy-1], 1), 2)
  sub = median(quads, dim = 3)
  im[0:dimx/2-1, 0:dimy/2-1]       = sub-quads[*, *, 0]
  im[dimx/2:dimx-1, 0:dimy/2-1]    = reverse(sub-quads[*, *, 1], 1)
  im[0:dimx/2-1, dimy/2:dimy-1]    = reverse(sub-quads[*, *, 2], 2)
  im[dimx/2:dimx-1, dimy/2:dimy-1] = reverse(reverse(sub-quads[*, *, 3], 1), 2)
 endif

; %%%%% Shift the image, ready for cosmic ray
 if (hlog_all[i].optic_cfg ne 'narrow') then stop ;...as pixel-scale is hard-wired into the next line.
 shifts[*, i] = [hlog_all[i].raoff-hlog_all[0].raoff, hlog_all[i].decoff-hlog_all[0].decoff]*3600./0.01
 th =  hlog_all[i].pa*!pi/180 ;Theta
 shifts[*, i] = [[cos(th), -sin(th)], [-sin(th), -cos(th)]]#shifts[*, i]
 dcube[*, *, i] = shift(im, -shifts[0, i],  -shifts[1, i])
endfor

; %%%%% Now for the main Cosmic-ray rejection stuff, and un-shift
; images (for supersky)
if (nframes ge 4) then begin ;If we were careful, 3 frames would be enough...
 medcube =  median(dcube,  dim = 3)
 sdevcube = fltarr(dimx, dimy, nframes)
 for i=0,nframes-1 do sdevcube[*, *, i]= (dcube[*,*,i]-medcube)^2
 sdevcube = total(sdevcube, 3)- max(sdevcube,  dim = 3)
 sdevcube = sqrt(sdevcube/(nframes-2))
 sdevcube = sdevcube > 1.5*smooth(sdevcube,8, /edge_truncate)
 for i = 0, nframes-1 do begin
  ;;The "3" is needed for a single high-Strehl frame.
  w =  where(dcube[*, *, i] gt 3*(medcube > 0)+6.*sdevcube) 
  if (w[0] ne -1) then begin
    w = array_indices(medcube, w)
    for j = long(0), n_elements(w)/2-1 do $
     dcube[w[0, j], w[1, j], i] =  medcube[w[0, j], w[1, j]]
  endif
  dcube[*, *, i] = shift(dcube[*, *, i], shifts[0, i],  shifts[1, i])
 endfor
endif

; %%%%% Make up supersky
if (skies[0] eq -1) then $   
 makedithersky_nirc2,dcube,ssky,starmask=starmask, darks = darks,  gain = gain, medsub=medsub $;!!!, shifts = shifts,   $
else if (skies[0] eq -2) then begin
 ssky=0
 darks = dcube
endif else begin
 ; %%%%%  Begin loop over data frames 
 for i=0,n_elements(skies)-1 do begin
 ; %%%%%  Read in sky data
  if (n_elements(datadir) ne 1) then stop
  filename=skydir+"n"+string(skies[i],format="(I4.4)")+extn 
  print,'Reading File: ',filename
  frame=float(reform(readfits(filename,head)))
  frame =  fix_bad_pixels(frame,  bad = bad_pixels)
  ; %%%%% Accumulate frames
  if(i eq 0) then scube=frame else scube=[[[scube]],[[frame]]]
 endfor    
 ssky = median(scube,  dim = 3)
 darks = dcube
 for i = 0, nframes -1 do darks[*, *, i] = scube[*, *, i mod n_elements(skies)]
endelse
; %%%%%  Again loop over data frames (now that we have ssky)
for i=0,nframes-1 do begin
  im=dcube(*,*,i)
  dim = darks(*, *, i)
  dimx=(size(im))[1] & dimy=(size(im))[2]

; Now Check for 85% Saturated Pixels.
; %%%%%  Subtract off Supersky 
  im=im-ssky
  dim = dim-ssky

; %%%%% Gain correction:
  im=im/gain
  dim =  dim/gain

 ;%%%%%  Remove cosmic rays or residual bad pixels (MJI) This is now a
 ;second-pass... (and could have different settings) %%%%%
 if (nocosmic eq 0) then begin
 ;6-sigma (default) is lots, but remember that we have 65000 pixels.
 im  = sigma_filter_nirc2(im,7,n_sigma=n_sigma,/all,/mon,/iterate)
 dim = sigma_filter_nirc2(dim,7,n_sigma=n_sigma,/all,/mon,/iterate)
 ;Remove any 'blinking' pixels not taken into account with bad pixmap
 min_poss = median(im)-3*stdev(im)
 neg =  where(im lt min_poss, nneg)
 dneg =  where(dim lt min_poss, dummy)
 if (neg[0] ne -1) then begin
   im[neg] = min_poss
   print,  nneg, ' residual blinking pixels fixed.'
 endif
 if (dneg[0] ne -1) then dim[dneg] = min_poss
 ;This was Peter's line. It misses negative bad pixels and
 ;removes part of the speckle pattern
 ;im = sigma_filter_nirc2(im,5,n_sigma=4,/all,/mon,threshold=3)
endif

; %%%%% Optionally determine D.C. offset in each frame 
; %%%%% Use external frame edge outside 140 pix radius
  if (plotall) then !p.multi=[0,1,2]
  if (noskyfit eq 0) then begin             ; Here we do the full sky_subtract
     sky_subtract_nirc,im,120./256.*sqrt(dimx*dimy),stats=stats, $
                      trim=skytrim,plotit=plotall,bin=5,subtr=0
  endif else begin
  if (noskyfit eq 1) then begin  ; Here we just calculate the stats (No Subtraction)
     sky_subtract_nirc,im,120./256.*sqrt(dimx*dimy),stats=stats, $
                      trim=skytrim,plotit=plotall,bin=5,subtr=1
  endif else stats=[0,0,0,0,0]
  endelse

; %%%%% Determine and Center the speckle cloud. Convolve with a
; Gaussian and find the peak. Don't look near edges.
; (copied from pharomkcube)
if (keyword_set(manclick)) then begin
    image_cont, (im>0)^0.5, /noc, tit='Click on Star'
    cursor, xpeak, ypeak
endif else begin
    bw = 30 ;; border of the detector to be avoided
    myKer = shift(exp(-(dist(11,11)/(2.0))^2), 5,5)
    temp0 = convol(im, myKer)
    mx = max(temp0[bw:dimx-bw, bw:dimy-bw], mxy)
    ind = array_indices(temp0[bw:dimx-bw, bw:dimy-bw], mxy)
    xpeak = ind[0]+bw & ypeak = ind[1]+bw
endelse
  xpeaks=[xpeaks,xpeak]  ; Recording Peak Position.
  ypeaks=[ypeaks,ypeak]
  newdimxy=setsquare 

; %%%%% Check if we are near the chip-edge
  edg_warn=0
  if (xpeak gt dimx-newdimxy/2 or xpeak lt newdimxy/2 $
   or ypeak gt dimy-newdimxy/2 or ypeak lt newdimxy/2) then begin
    print,'### WARNING: Center of Speckle Cloud found at :',xpeak,ypeak
    print,'###          This is too near the edge !!!'
    if (xpeak gt dimx-newdimxy/2) then xpeak=dimx-newdimxy/2
    if (xpeak lt newdimxy/2) then xpeak=newdimxy/2
    if (ypeak gt dimy-newdimxy/2) then ypeak=dimy-newdimxy/2
    if (ypeak lt newdimxy/2) then ypeak=newdimxy/2
    edg_warn=1
  endif

; %%% Optionally de-warp image %%%
 if (dewarp eq 1) then begin
  im0 = im
  im = nirc2warp(im0,hd=head)
 endif


; %%%%% Cut data array out 
   oldxp = xpeak
   oldyp = ypeak
   im=grabnxn(im,newdimxy,x=xpeak,y=ypeak)
   dim=grabnxn(dim,newdimxy,x=oldxp,y=oldyp)
   dimx=(size(im))[1] & dimy=(size(im))[2]
   if(dimx ne newdimxy or dimy ne newdimxy) then $
       print,'WARNING### did not square array properly'

; %%%%% De-Stripe the image (TO BE ADDED?).
; %%%%% Phase 2 De-Stripe of the image removes MULTIPLICATIVE noise
;  if (keyword_set(destripe) eq 1) then begin

  if (plotall gt 0) then begin
;     if(dimx gt 256) then tvscl,rebin(im,256,256) else tvscl,im
      image_cont, im, /asp, /noc
     legend,['File n'+string(speck[i],format="(I4.4)")+".fits"]
     ;Give the user a chance to see the image.
     wait,  0.3
  endif

; %%%%% Generate Diagnostics 
  tot_flx=[tot_flx,total(im)]
  pk_flx=[pk_flx,max(im)]
  sky_bg=[sky_bg,stats(1)]

; %%%%% center image only if needed (too near edge)
  if(edg_warn eq 1) then begin
    mx=max(smooth(im,20,/edge_truncate),mxy)
    xpeak=mxy mod dimx &  ypeak=mxy/dimy
    im=shift(im,dimx/2-xpeak,dimy/2-ypeak)
  endif

; %%%%% Do aperture photometry on centered image
  photometry_nirc, im, photometry
  flux=[[flux],[photometry]]
  if(i eq 0) then cube=im else cube=[[[cube]],[[im]]]
  if(i eq 0) then darkcube=dim else darkcube=[[[darkcube]],[[dim]]]

endfor                            ;%%%%% FINISH LOOP OVER ALL SPECKLE FRAMES 

; %%%%% Strip useless leading element from Diagnostics:
fstats=fltarr(5,nframes)
fstats(0,*)=xpeaks(1:nframes)
fstats(1,*)=ypeaks(1:nframes)
fstats(2,*)=tot_flx(1:nframes)
fstats(3,*)=pk_flx(1:nframes)
fstats(4,*)=sky_bg(1:nframes)
flux=flux(*,1:nframes)
print,'Mean Location of centroid X,Y: ',mean(fstats[0,*]),', ',mean(fstats[1,*])



; %%%%% Reduce HLOG down to essential entries

s='' &  i=0 &  f=0.0 &  d=double(0.0)
hlog=freud('');{instrument:s,nax1:i,nax2:i,nax3:i,t_int:f,coadd:i,filter:s,slit:s,$ ;from headers
 ;       optic_cfg:s,lyot:s,grism:s,source_name:s,utc:s,                 $ 
 ;       date:s,jd:d,elevation:f,airmass:f,pa:f,del_pa:d,del_elev:f,ra:d,dec:d,equinox:f}

hlog.instrument = hlog_all[0].instrument
if(n_elements(uniq(hlog_all.instrument)) gt 1) then begin 
  print, "WARNING - Incompatible INSTURMENTS in data"
  stop
endif
hlog.nax1 = hlog_all[0].nax1
if(n_elements(uniq(hlog_all.nax1)) gt 1) then  begin
  print, "WARNING - Incompatible X Axis in data"
  stop
endif
hlog.nax2 = hlog_all[0].nax2
if(n_elements(uniq(hlog_all.nax2)) gt 1) then  begin
  print, "WARNING - Incompatible Y Axis in data"
  stop
endif
if(n_elements(uniq(hlog_all.t_int)) gt 1) then print,"WARNING - Incompatible T_ints in data!"
    hlog.t_int = hlog_all[0].t_int 
if(n_elements(uniq(hlog_all.coadd)) gt 1) then print,"WARNING - Incompatible coadds in data!"
    hlog.coadd = hlog_all[0].coadd 
hlog.filter = hlog_all[0].filter
if(n_elements(uniq(hlog_all.filter)) gt 1) then begin 
  print, "WARNING - Incompatible Filters in data"
  stop
endif
hlog.slit = hlog_all[0].slit
if(n_elements(uniq(hlog_all.slit)) gt 1) then begin
  print, "WARNING - Incompatible Slit Config in data"
  stop
endif
hlog.optic_cfg = hlog_all[0].optic_cfg
if(n_elements(uniq(hlog_all.optic_cfg)) gt 1) then begin
  print, "WARNING - Incompatible Optic Config in data"
  stop
endif
hlog.lyot = hlog_all[0].lyot
if(n_elements(uniq(hlog_all.lyot)) gt 1) then begin 
  print, "WARNING - Incompatible Lyot Config in data"
  stop
endif
hlog.grism = hlog_all[0].grism
if(n_elements(uniq(hlog_all.grism)) gt 1) then begin
  print, "WARNING - Incompatible Grism Config in data"
  stop
endif
if(n_elements(uniq(hlog_all.coadd)) gt 1) then print,"WARNING - Incompatibe Target Name in data!"
    hlog.source_name = hlog_all[0].source_name 

  hlog.utc        =hlog_all[0].utc
  hlog.date       =hlog_all[0].date
  hlog.jd         =hlog_all[0].jd
  hlog.elevation  =hlog_all[0].elevation
  hlog.del_elev   =hlog_all[0].elevation-hlog_all[nframes-1].elevation
  hlog.airmass    =hlog_all[0].airmass
  hlog.pa         =hlog_all[0].pa
  hlog.del_pa     =hlog_all[0].pa-hlog_all[nframes-1].pa

if(max(hlog_all.ra)-min(hlog_all.ra) gt 0.5) then print,"WARNING - Incompatible RA CO-ORDS in data"
if(max(hlog_all.dec)-min(hlog_all.dec) gt 0.5) then print,"WARNING - Incompatible DEC CO-ORDS in data"

  hlog.ra         =hlog_all[0].ra
  hlog.dec        =hlog_all[0].dec
  hlog.equinox    =hlog_all[0].equinox


; %%%%% Try to find precise parallactic angle
;fix_pa_nirc,headinfo,skyheadinfo,pa,del_pa
;headinfo.pa=pa
;headinfo=create_struct(headinfo,'del_pa',del_pa)

dcube = darkcube

end
