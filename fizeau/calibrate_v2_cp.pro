
;$Id: calibrate_v2_cp.pro,v 1.63 2010/07/04 22:51:48 mireland Exp $
;$Log: calibrate_v2_cp.pro,v $
;Revision 1.63  2010/07/04 22:51:48  mireland
;Minor bug-fixes for conica. bs2amp doesn't do an infinite loop anymore.
;
;Revision 1.62  2010/06/18 05:52:32  snert
;fixed bug in call to edit_cal4src
;
;Revision 1.61  2010/06/15 01:31:22  snert
;tiny bug fix
;
;Revision 1.60  2010/05/31 10:20:07  tevans
;*** empty log message ***
;
;Revision 1.59  2010/05/31 10:00:42  tevans
;*** empty log message ***
;
;Revision 1.56  2010/03/31 13:59:11  mireland
;Added an option for dispersion correction, based on inputting an idlvar
;file with the closure-phase basis vector caused by dispersion.
;
;Revision 1.55  2010/03/26 11:44:29  mireland
;Added a !ROOT_DIR system variable, changed the inputs for qbe_nirc2.pro
;so that you can specify all indices or just starting indices, and fixed a bug
;where bad data flagging was turned off.
;
;Revision 1.54  2010/03/24 03:28:05  snert
;Added the ability to ask for 1cal 1src pauses so they are not required by default
;
;Revision 1.53  2010/03/16 22:54:14  mireland
;Removed obselete bits of code, made emacs indenting and made the code
;fit into 100 columns.
;
;Revision 1.52  2010/03/16 01:54:50  mireland
;Moved David Bernat's analysis to a different (non-released) file.
;
;Revision 1.51  2009/12/10 23:45:22  snert
;mireland here, not snert. Just fixed a bug with the bad flags in oifits stuff.
;
;Revision 1.50  2009/11/20 08:37:32  snert
;Unsure what these changes are... but the plots aren't working at Keck.
;
;Revision 1.49  2009/10/21 05:32:16  snert
;Added support for edit_cal4src separately using cal4src=-2
;
;Revision 1.48  2009/10/21 05:15:13  snert
;typo correction
;
;Revision 1.47  2009/10/14 05:00:21  snert
;added support for edit_cal4src matrix editor
;
;Revision 1.46  2009/09/28 23:54:17  snert
;Added features to calibrate_v2_cp suitable for calibrating lots of files.
;
;Revision 1.45  2009/09/27 00:17:42  snert
;Oops - pharomkcube is currently being bugshot. Calibrate_v2_cp should
;only have a median(cp) changed to 2/3 * median(cp) as per the Upper
;Sco paper appendix.
;
;Revision 1.44  2009/09/26 12:02:57  snert
;TME fixed a small bug in user-specifying the upper closure phase error cutoff.
;
;Revision 1.43  2009/09/26 08:36:04  snert
;Small changes made by TME to user-selection of closure phase error cutoffs with the interactive histogram plot.
;
;Revision 1.42  2009/07/27 00:07:03  snert
;Updated to include a oit3.flag boolean variable to mark bad values and removed the 'large errors' that has been inserted, as per the oifits standard
;
;Revision 1.41  2009/06/29 02:27:01  snert
;Removed x=-1 for the V^2 rejection. This should _NEVER_ have been commited.
;
;Revision 1.40  2009/04/01 00:04:42  mireland
;Added a coherent averaging keyword to calc_bispect
;
;Revision 1.39  2009/03/03 07:11:12  snert
;MJI commiting stuff for Conica.
;
;Revision 1.38  2009/01/16 06:43:37  mireland
;A bunch of changes to again make this code work with Keck/nirc2 data. Some
;of these changes maybe need some more thought in the context of Cornell changes.
;
;Revision 1.37  2008/12/21 12:10:08  mireland
;Make this work for Keck again (savestring returned to original) and made
;fonts a little nicer for calibrating 14 stars against each other (normal
;for cluster mode observing)
;
;Revision 1.36  2008/12/01 21:23:46  dbernat
;Logistical changes to DWB Method.
;
;Revision 1.35  2008/11/24 21:24:07  dbernat
;Retooled DWB Method.  Comments Below.  Added Skip_Baseline_Rejection option
;
;Revision 1.34  2008/10/30 06:29:14  snert
;Added woody's savestring bug fix.
;
;Revision 1.33  2008/10/24 21:42:47  dbernat
;Save BS_ALL and added code for DWB_METHOD.  Also, I think the rejection of calibrators is ignored when calculating the final closure phase.  Search for FIX?
;
;Revision 1.32  2008/09/19 18:05:17  dbernat
;Nicer indentation
;
;Revision 1.31  2008/06/15 04:03:26  mireland
;I guess I fixed some stuff.
;
;Revision 1.30  2008/06/14 03:05:26  mireland
;Made code nicer for Trent.
;
;Revision 1.29  2008/06/13 01:45:38  mireland
;Fixed a bug.
;
;Revision 1.28  2008/05/21 23:12:46  mireland
;Haven't commited in a while - again unsure what the exact changes are...
;
;Revision 1.27  2008/05/21 23:11:28  mireland
;Not quite sure what all these changes are - but now they are commmited anyway.
;
;Revision 1.26  2007/08/02 23:55:05  mireland
;Added specklecube=2 and specklecube=4 modes.
;
;Revision 1.25  2007/07/19 21:47:21  mireland
;Unsure why mkrefbias has changed. Fixed a HUGE bug in the mrg file
;creation from calibrate_v2_cp.pro
;
;Revision 1.24  2007/06/18 17:19:13  mireland
;Bugfixes...
;
;Revision 1.23  2007/06/17 19:22:11  mireland
;More cp_cov stuff...
;
;Revision 1.22  2007/06/14 18:59:19  mireland
;Some of the nirc2 stuff shouldn't have changed. Trying to finish the
;cp_cov stuff.
;
;Revision 1.21  2007/06/13 20:26:14  mireland
;Added cp covariance matrix functionality.
;
;Revision 1.20  2007/06/12 23:52:40  mireland
;Lots of changes: improved cosmic ray rejection, better naming and
;directory stuff, modifications to closure-phase histogram plots...
;
;Revision 1.19  2007/06/06 03:21:15  mireland
;Fixed a double-space problem.
;
;Revision 1.18  2007/06/06 00:08:34  mireland
;Fixed a bug in cal4src regarding rejecting source files, and added better
;file naming to calibrate_v2_cp.pro
;
;Revision 1.17  2007/06/02 13:01:17  frantzm
;last changes made to the code before leaving Palomar (June 2007)
;
;Revision 1.16  2007/05/31 04:41:55  mireland
;Added the capability to add in source names.
;
;Revision 1.14  2007/05/18 19:11:10  mireland
;Changed some defaults (histogram cutoff, window size) and removed a couple of annoying
;plots that flashed up.
;
;Revision 1.13  2007/04/17 18:12:34  mireland
;Fixed plots in calibrate_v2_cp. Bugs and minor additional modes in other programs.
;
;Revision 1.12  2006/06/20 03:48:59  mireland
;No idea why nirc2 always comes up here... I added a closure phase histogram plot
;to the multiple-cal correction.
;
;Revision 1.6  2006/03/14 21:54:54  mireland
;Added a cal4src to clog (so that it can be modified without destroying the
;original). Added a save of quan to the final cubeinfo file.
;
;Revision 1.4  2006/03/02 21:18:05  mireland
;Fixed some bugs, and added extra sophistication to multiple calibrator
;files. Also added new LWS filters to freud etc and fixed PA.
;
;Revision 1.1  2006/01/12 23:50:23  mireland
;Commit of the new .pro calc_bispect and calibrate scripts, and the
;first LWS code version.
;
;Revision 1.4  2006/01/06 19:27:08  mireland
;Corrected orientation-related parts of the code. Added olog.uflip.
;
;Revision 1.3  2005/12/23 19:51:32  gekko
;Peter's changes, commited by Mike. Something is wrong here - no idea
;why CVS thinks that essentially all these files are modified...
;
;Revision 1.2  2005/12/20 21:26:28  mireland
;Added $Id: calibrate_v2_cp.pro,v 1.63 2010/07/04 22:51:48 mireland Exp $ to see if it works.
;
;######## RELEASE CLIP HERE ########

;This script calibrates v^2, closure phase, and Mike's complex
;visibility. The results are saved to an oifits file (and other formats). 
; NB: 1) Currently, the u,v coordinates etc comes from src[0] only, and
; The olog.cal4src array needs sophistication added (in flagging stage?)
; 2) The wtmn function (Mike's weighted mean) averages the various cal
; and source cubes together. Some kind of non-least squares weighting
; would be preferable (an option to wtmn).

; Inputs:
;   cubeinfo_file:  The cubeinfo file
;   root_dir:       The directory containing templates/
; Keywords:
;   reset:   Set this keyword to reset any special options (or bad
;            baselines etc) from a previous calibration attempt. 
;  average_src: average source files together. NOT the default.
;  others: Look below under clog
;  display_calibs_too:  This program displays each source calibrated
;  with each calibrator, then asks for single calibrators to be
;  rejected.  If this keyword is set, then not only are calibrated
;  sources plotted but the calibrators themselves are displayed.
;  After all, that's really the important indicator of a strong calibrator.
;  freeze - enables the pausing of data processing when 1 cal 1 src (1/0,on/off)


pro calibrate_v2_cp, cubeinfo_file,  root_dir=root_dir, reset = reset, apply_phscorr = apply_phscorr, $
                     subtract_cp = subtract_cp,  average_src = average_src,  cal4src = cal4src, $
                     add_names = add_names, display_calibs_too=display_calibs_too, $
                     src_for_bad_holes = src_for_bad_holes,  linear_v2_cut = linear_v2_cut,  $
                     nocal = nocal, save_all_cps = save_all_cps, output_keckmrg=output_keckmrg,$
                     skip_baseline_rejection = skip_baseline_rejection,  v2div = v2div, $
                     special=special, skip_cp_rejection = skip_cp_rejection, bsdir=bsdir, $
                     cal_cp_inspect=cal_cp_inspect, reject_lowv2=reject_lowv2, see_all=see_all,$
                     freeze=freeze, disp_fit_file=disp_fit_file,starlist=starlist

;; Now set the default root_dir if we can
defsysv, '!ROOT_DIR', exists=exists
if exists then root_dir=!ROOT_DIR
if not keyword_set(root_dir) then begin
 print, 'ERROR: Must set root_dir keyword or !ROOT_DIR system variable.'
 stop
endif
If( NOT keyword_set( skip_baseline_rejection ) ) THEN skip_baseline_rejection = 0
If( NOT keyword_set( skip_cp_rejection ) ) THEN skip_cp_rejection = 0
If( NOT Keyword_Set( nocal ) )                   THEN NoCal = 0
;;"special" is a special string to label the oifits files with.
If( NOT keyword_set( special ) )                 THEN special=''
If( NOT keyword_set( freeze ) )                  THEN freeze = 0

; File and Directory Options
if (not keyword_set(src_for_bad_holes)) then src_for_bad_holes = 0
dir =  ''
pos = strpos(cubeinfo_file,'/',  /reverse_search)
if (pos ne -1) then begin
    dir =  strmid(cubeinfo_file,  0,  pos) + '/'
    cubeinfo_file = strmid(cubeinfo_file,  pos+1)
endif
if not keyword_set(bsdir) then bsdir=dir
print, bsdir
restore, dir +cubeinfo_file
cubedates =  olog.cube_fname[*, 1] 

; Add target names if necessary
if keyword_set(add_names) then begin
    fill_source_name, olog,starlist=starlist
endif

if (not keyword_set(linear_v2_cut)) then linear_v2_cut = 0

;____________________________________________________________
;  Calibration Options
;____________________________________________________________


if (olog.logflag eq 0) then begin
    print,  'This data has not been processed yet. Run calc_bispect first.'
    stop
endif else if (olog.logflag eq 1 or keyword_set(reset)) then begin
    
                                ;Set some default calibration options
    clog = inquire('clog',olog)
endif 
if (keyword_set(average_src) eq 0) then average_src = clog.average_src


;To manually reset the clog flags, do this here. The flags are:
; clog.correction_const : For the visibility variance correction (see
;             Mike Ireland's thesis). Set to 1.30-ish for NIRC.
; clog.nows : If applying the visibility variance correction, nows=1 will
;             fit a circularly symmetric 2d function to visibility
;              variance as a function of baseline
; clog.apply_phscorr : Set to 1 to correct for phase slope difference between
;             sub-apertures. Important for LWS data set t
; clog.subtract_cp : Set to subtract calibrator closure phases from source.
; clog.diagonal_cov : Set to 0 to use the bispectral covariance matrix
;             when finding phase from closure phase. This should
;             always be 1 if less than 20 data frames are availible
; clog.bad_holes : known bad subapertures (-1 for none)
; clog.bad_baselines : known bad baselines (an array, -1 for
;             none). Setting bad_holes will automatically set bad_baselines
; clog.bad_bispect : known bad bispectral points. Setting bad_holes or
;             bad_baselines will automatically set this vector.
; clog.cal4src : The adjusted cal4src matrix

if (keyword_set(subtract_cp)) then clog.subtract_cp =  subtract_cp > 0
if (keyword_set(apply_phscorr)) then clog.apply_phscorr =  apply_phscorr > 0
if (keyword_set(cal4src)) then clog.cal4src =  cal4src
if (clog.cal4src[0] eq -1) then clog.cal4src = make_cal4src(olog)
if (clog.cal4src[0] eq -2) then clog.cal4src = edit_cal4src(olog.cal4src, olog.source_name)
if (clog.cal4src[0] eq -3) then clog.cal4src = make_cal4src3(cubeinfo_file,quad=quad)
if (keyword_set(v2div)) then clog.v2div = v2div

;; clog.cal4src is editted as calibrators are removed from use.
;; This is a useful variable for knowing whether calibrators have been
;; deselected or if they were never intended in the first place.
OrigCal4Src = clog.cal4src


;Set the bad vectors
bad_holes =  clog.bad_holes
bad_baselines =  clog.bad_baselines
bad_bispect =  clog.bad_bispect

;NOTES for bad_baselines: For the feii filter on NIRC, always have at least [6,10,129,171]
;    For the oii filter on NIRC, always have at least 
; [14,15,16,17,48,50,66,69,71,72,79,80,82,83,84,85,87,88,97,99,101,123,125,145,148,198,202]

;_____________________________________________________________
; The rest is done automatically.
;

src =  where(total(clog.cal4src, 1) gt 0,  complement = cal)
ncal =  n_elements(cal)
if (cal[0] eq -1) then begin
    ncal = 0
    print,  '!!! No Calibrators !!! Forcing subtract_cp=0'
    subtract_cp = 0
    clog.subtract_cp = 0
endif
nsrc =  n_elements(src)
if (src[0] eq -1) then begin    ;No calibrators used...
    nsrc = (size(clog.cal4src))[1]
    src = indgen(nsrc)
    ncal = 0
endif
ncubes =  ncal + nsrc

if (keyword_set(nocal)) then begin
    ncal = 0
    clog.cal4src[*] = 0
endif

;Use the matched-filter file to determine the mask geometry
;(n_baselines etc)
mf_filestring = root_dir + '/templates/' + plog.mf_file
restore, mf_filestring

;To make this neater, create structures that are easy to read. For
;saving to oifits and calibrating, we won't use the full information
;contained in the data for now. NB the `master' definition of
;used_quantities is in get_used_quantities.pro.

;; DWB: get_used_quantities now also returns in the structure a key
;; called  bs_all which contains all the bispectrum from the data
;; file.  This is to envoke a bootstrapping approach to calculating
;; closure phase errors and the covariance matrix of the calibrated
;; target data.  Seach here for "dwb_method" and bootstrap_cp_err.pro.
;;
;; Because the dimensions of bs_all can vary for each source or
;; calibrator, the data is allocated as only a pointer first (a
;; datatype of uniform size) and then the bs_all data is attributed to
;; that pointer.  You can access the arry by *(quan.bs_all) and treat
;; is just like a variable.

used_quantities =  {v2:fltarr(n_baselines), v2corr:fltarr(n_baselines),  $
                    v2_err:fltarr(n_baselines), cp:fltarr(n_bispect),  cp_err:fltarr(n_bispect),$
                    cp_cov:fltarr(n_bispect, n_bispect), v2_all: Ptr_New( /Allocate_Heap ), $
                    bs_all: Ptr_New( /Allocate_Heap ), amp:fltarr(n_baselines), $
                    amp_err:fltarr(n_baselines),  phase:fltarr(n_baselines), $
                    phase_err:fltarr(n_baselines), flag:intarr(n_baselines), $
                    bsflag:intarr(n_bispect) }
  
all_quan =  replicate(used_quantities, ncubes)
calib_src_quan     =  replicate(used_quantities, nsrc)
quan   =  used_quantities

;Add bad baselines based on bad holes etc... 
add_bad,  bad_holes,  bad_baselines,  bad_bispect,  bl2h_ix,  bs2bl_ix,  $
  good_baselines,  good_bispect

;Now we should have all important variables (like n_baselines) so we
;can restore and extract variables from the src and cal files...
r =  sqrt(u^2+v^2)
for i = 0, ncubes-1 do begin
    
    ;;For backwards-compatability, allow the bs_names variable not to be
    ;;present in plog.
    if (n_tags(plog) ge 6) then filestring = bsdir+plog.bs_names[i] else $
      filestring =  bsdir + 'bs' + olog.cube_fname[i, 1] + plog.special+'.idlvar'
    
    all_quan[i] =  get_used_quantities(filestring,  bad_baselines,  bad_bs, root_dir, $
      nows=clog.nows, apply_phscorr = clog.apply_phscorr,correction_const = clog.correction_const)
    
    ;;Divide by expected V and V^2 for cal stars here:
    if (olog.cube_tsize[i] gt 0) then begin
        uniform_disk, r,  [mas2rad(olog.cube_tsize[i]), 1.0],  f
        all_quan[i].amp = all_quan[i].amp/f
        all_quan[i].amp_err = all_quan[i].amp_err/f
        all_quan[i].v2 = all_quan[i].v2/f^2
        all_quan[i].v2_err = all_quan[i].v2_err/f^2
    endif
    
                                ;If cube i is used as a calibrator, use it to look for bad holes.
    If( NOT skip_baseline_rejection ) THEN BEGIN
        if( (total(clog.cal4src, 2) )[i] gt 0 || src_for_bad_holes) then begin
            dummy =  linfit(sqrt(u^2+v^2), alog(all_quan[i].v2 > 0.001),  yfit = yfit)
            for j = 0, n_holes -1 do begin
                w =  where(bl2h_ix[0, *] eq j or bl2h_ix[1, *] eq j)
                print,  mean(all_quan[i].v2[w]/exp(yfit[w]))
                if (mean(all_quan[i].v2[w]/exp(yfit[w])) lt 0.3) then begin
                    plot, r, all_quan[i].v2/exp(yfit), psym=4,  xtitle = 'Baseline (wavelengths)',$
                      ytitle =  'V^2 / Fitted V^2',  xr = [0, max(r)]
                    oplot,  r[w], all_quan[i].v2[w]/exp(yfit[w]), psym=2
                    print,  'Reject this hole? (click left of axis for no, anywhere else for yes)'
                    cursor,  x,  y
                    wait,  0.4
                    if (x gt 0) then bad_holes =  [bad_holes, j]
                endif
            endfor
        endif
    endif
endfor

bad_holes = bad_holes[uniq(bad_holes)]
if (bad_holes[0] eq -1 and n_elements(bad_holes) gt 1) then bad_holes = bad_holes[1:*]
add_bad,  bad_holes,  bad_baselines,  bad_bispect,  bl2h_ix,  bs2bl_ix,  $
  good_baselines,  good_bispect

;__________Calibrate the Data_______________
;Firstly, do one source cube at a time


;; Plot 1) The Calibrated Source Data and 2) if keyword set, the
;; Unadjusted Calibration Data

device, get_screen_size=screen_size
;; Draw a larger window if we're displaying calibrators too
;; Also adjust the font so it views nicely
IF( keyword_set( display_calibs_too ) EQ 1 ) THEN BEGIN
    window, /free, xsize = screen_size[0]*0.9, ysize = screen_size[1]*.9 
    charsize = 1.3
ENDIF ELSE BEGIN
    if (keyword_set(cal_cp_inspect) eq 1) then $
      window,  xsize = screen_size[0]*0.9, ysize = screen_size[1]*.45 
    charsize = 1.3
ENDELSE 

;;The calibration happens one source cube at a time.
for i = 0, nsrc-1 do begin
    ;;w is all calibrators to use on source i (spec. index src[i]) 
    w =  where(clog.cal4src[*, src[i]] eq 1, count)
    ;;For multiple calibrators, allow the user to reject 1 or more.
    cnum = 1000
    ;; If only 1 calib at start, show it and stop if freeze is on.  If 2, and 1 is discarded, just go on.
    firstglance = 1 
    ;; If there are lots of calibrators, then this calibrator
    ;; rejection has to be done automatically, as the plots would get crazy!
    if (n_elements(w) gt 5 and not keyword_set(see_all)) then begin
        print, n_elements(w), i
        cp_rms = fltarr(1)
        for j=0,n_elements(w)-1 do begin
            this_cp_arr = all_quan[src[i]].cp[good_bispect] - all_quan[w[j]].cp[good_bispect] $
              + randomn(seed,n_elements(good_bispect))*1e-6
            this_cp_rms = mean(this_cp_arr^2)
            cp_rms = [cp_rms, this_cp_rms]
        endfor
        cp_rms = cp_rms[1:*]
        if (not keyword_set(cal_cp_inspect)) then begin
            min_cp_rms = min(cp_rms)
            w = w[where(cp_rms lt 1.5*min_cp_rms)] ; the factor 1.5 is somewhat arbitrary
        endif else begin
            m = median(cp_rms)*(180.0/!pi)^2 ; 
            plothist,cp_rms*(180.0/!pi)^2,bin=(1.5*m)/10.0,xr=[0,3*m],$
              xtit='Mean squared closure phase (deg2)', ytit='Number of calibrators',$
              charsize=2,xsize=screen_size[0]*0.6,ysize=screen_size[1]*0.6
            oplot,  [m, m],  [0, 1000],  line = 1
            legend,['Median'],line=[1],/right_leg,charsize=2
            print,  'Click on cutoff for mean squared closure phase...'
            wait,  0.3
            cursor,  cp_rms_upper,  y
            oplot, [cp_rms_upper, cp_rms_upper], [0, 1000], line=2
            w = w[where(cp_rms lt cp_rms_upper)]    
        endelse
        ;;!!! Now we must update cal4src !!!
    endif else while (count gt 0 and cnum ge 0) do begin ; otherwise do by-eye inspection
        
        ;; Format how plots are to be displayed in the window
        If( keyword_set( display_calibs_too ) EQ 1 ) THEN !p.multi = [0, n_elements(w), 4] $
        ELSE !p.multi = [0, n_elements(w), 2]
        
        print, 'For source cube', strtrim(i+1),$
          ', type the number of the calibrator to reject (-1 for none)'
        r =  sqrt(u^2+v^2)*filter[0]
        
        ;; Display 1st Row - V2 of SOURCE AFTER CALIBRATION
        for j = 0, n_elements(w)-1 do begin
            ploterr, r,all_quan[src[i]].v2/all_quan[w[j]].v2, $
              all_quan[src[i]].v2*all_quan[w[j]].v2_err/all_quan[w[j]].v2^2, $
              charsize=charsize, psym=2 , xrange=[0,max(r)],yrange =[0, 2.5],  ystyle = 1, $
              xtitle = 'Baseline (m)', ytitle = 'Vis Squared', title = '#'+strtrim(w[j], 2) + $
              ':'+olog.cube_fname[w[j], 1]+ ':' + olog.source_name[w[j]]
            oplot, [0,max( r ) ], replicate( median(all_quan[src[i]].v2/all_quan[w[j]].v2), 2 ),$
              color=250
        endfor
        
        all_quan[src[i]].cp[good_bispect] += 1.e-6

        ;; Display 2nd Row - CP of SOURCE AFTER CALIBRATION        
        for j = 0, n_elements(w)-1 do begin
            plothist,  180/!pi*(all_quan[src[i]].cp[good_bispect] - $
              all_quan[w[j]].cp[good_bispect] + randomn(seed,n_elements(good_bispect))*1e-6), $
              bin = median(abs(all_quan.cp[good_bispect]))/4*180/!pi,  charsize=charsize, $
              xtitle = 'Closure phase (degs)'
        endfor
        If( keyword_set( display_calibs_too ) EQ 1 ) THEN BEGIN
            ;; Display 3rd Row - V2 of CALIBRATOR Only
            for j = 0, n_elements(w)-1 do begin
                ploterr, r,all_quan[w[j]].v2, all_quan[w[j]].v2_err, $
                  charsize=charsize, psym=2 , xrange=[0,max(r)],yrange =[0, 1.5],  ystyle = 1, $
                  xtitle='Baseline (m)', ytitle='Vis Squared',  $
                  title = 'Cal Only: (#'+strtrim(w[j], 2) + '):'+olog.cube_fname[w[j],1]+ $
                  ':'+olog.source_name[w[j]]
            endfor
            
            ;; Display 4th Row - CP of CALIBRATOR Oonly
            for j = 0, n_elements(w)-1 do begin
                plothist, all_quan[w[j]].cp[good_bispect]*180/!pi,  $
                  bin = median(abs(all_quan.cp[good_bispect]))/4*180/!pi,  $
                  charsize=charsize, xtitle = 'Closure phase (degs)'
            endfor
        ENDIF
        
        If( ( n_elements(w) EQ 1 ) ) THEN BEGIN
            If( firstglance and freeze ) THEN stop
            break
        ENDIF
        
        firstglance = 0
        If( n_elements(w) NE 1 ) THEN BEGIN
            read,  cnum
                                ; w[ind] are the index of good calibs; w[wc] are bad
            ind =  where(w ne cnum, complement = wc)
            if (wc[0] ne -1) then clog.cal4src[ w[wc], src[i] ] =  0
            w = w[ind]
        ENDIF
        
                                ; Clear Display
        !p.multi = 0
    endwhile
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    
 ;;Calibrate amplitude quantities (NB assumes calibrator amp S/N > 5-ish
    if (ncal ge 1) then for j =  0, n_baselines -1 do begin
        cmn =  wtmn(all_quan[w].v2[j], all_quan[w].v2_err[j], sdev)
        calib_src_quan[i].v2[j] =  all_quan[src[i]].v2[j]/cmn
        calib_src_quan[i].v2_err[j] =  sqrt(all_quan[src[i]].v2_err[j]^2/cmn^2 + $
                                            sdev^2*all_quan[src[i]].v2[j]^2/cmn^4)
        cmn =  wtmn(all_quan[w].amp[j], all_quan[w].amp_err[j], sdev)
        calib_src_quan[i].amp[j] =  all_quan[src[i]].amp[j]/cmn
        calib_src_quan[i].amp_err[j] =  sqrt(all_quan[src[i]].amp_err[j]^2/cmn^2 + $
                                             sdev^2*all_quan[src[i]].amp[j]^2/cmn^4)  
    endfor else calib_src_quan[i] = all_quan[src[i]] ;Uncalibrated
    if (clog.v2div) then begin
        calib_src_quan[i].v2_err /= mean(calib_src_quan[i].v2[good_baselines])
        calib_src_quan[i].v2 /= mean(calib_src_quan[i].v2[good_baselines])
    endif
    
    ;; Weight the calibrators
    cmn =  fltarr(n_bispect)
    cerr =  fltarr(n_bispect)
    cwts = fltarr(n_bispect,  n_elements(w))
    if (ncal ge 1) then for j = 0, n_bispect-1 do begin
        cmn[j]  =  wtmn(all_quan[w].cp[j], all_quan[w].cp_err[j], sdev,  wts = wts)
        cerr[j] = sdev
        cwts[j, *] = wts
    endfor
    
    ;;Based on the weights, calculate the calibrator cp and
    ;;covariance matrix. Note that wts includes a
    ;;correction based on the additional scatter amongst calibrators.
    ccp_cov =  fltarr(n_bispect,  n_bispect) 
    if (w[0] ne -1) then for j = 0, n_elements(w)-1 do $
      ccp_cov += ( cwts[*, j] # transpose(cwts[*, j]) ) * all_quan[w[j]].cp_cov
    if (clog.subtract_cp eq 1) then begin
        calib_src_quan[i].cp =  all_quan[src[i]].cp - cmn 
        calib_src_quan[i].cp_err =  sqrt( all_quan[src[i]].cp_err^2 + cerr^2 )
        calib_src_quan[i].cp_cov = all_quan[src[i]].cp_cov + ccp_cov
        ;;Multiple calibrator covariace matrices are now used correctly in the following
        ;;line... I think.
        cp2phase,  mf_filestring, calib_src_quan[i].cp, calib_src_quan[i].cp_err, $
          all_quan[src[i]].cp_cov+ccp_cov, $
          phase=phase, ph_err=ph_err,  diagonal_cov = clog.diagonal_cov
        calib_src_quan[i].phase =  phase
        calib_src_quan[i].phase_err =  ph_err
    endif else begin
        calib_src_quan[i].cp = all_quan[src[i]].cp
        calib_src_quan[i].cp_err = all_quan[src[i]].cp_err
        cp2phase,  mf_filestring, calib_src_quan[i].cp, calib_src_quan[i].cp_err, $
          all_quan[src[i]].cp_cov, $
          phase=phase, ph_err=ph_err,  diagonal_cov = clog.diagonal_cov
        calib_src_quan[i].phase =  phase
        calib_src_quan[i].phase_err =  ph_err
    endelse
endfor

;;For now, just get rid of this mode in the
;;closure-phase... independent of elevation. Use an inner product to
;;project the calib_src_quan onto the subspace in the disp_fit
;;direction and subtract this off.
if keyword_set(disp_fit_file) then begin
 restore, disp_fit_file
 for i=0,nsrc-1 do begin
     calib_src_quan[i].cp -= disp_fit*total(calib_src_quan[i].cp * disp_fit)/total(disp_fit^2)
 endfor
endif


;Now average the source files together - only applicable to equatorial telescopes.
if (keyword_set(average_src) eq 1) then begin
    for j = 0, n_baselines-1 do begin
        quan.v2[j] = wtmn(calib_src_quan.v2[j], calib_src_quan.v2_err[j],  sdev)
        quan.v2_err[j] =  sdev
        quan.amp[j] = wtmn(calib_src_quan.amp[j], calib_src_quan.amp_err[j],  sdev)
        quan.amp_err[j] =  sdev
                                ;Include unwrapping effects in averaging phase
        quan.phase[j] = calib_src_quan[0].phase[j] + $
          wtmn(rad2mpipi(calib_src_quan.phase[j]-calib_src_quan[0].phase[j]), $
               calib_src_quan.phase_err[j],  sdev)
        quan.phase_err[j] =  sdev
    endfor
    cwts = fltarr(n_bispect,  nsrc)
    for j = 0, n_bispect-1 do begin
        quan.cp[j] =  calib_src_quan[0].cp[j] + $
          wtmn(rad2mpipi(calib_src_quan.cp[j]-calib_src_quan[0].cp[j]), $
               calib_src_quan.cp_err[j],  sdev,  wts = wts)
        quan.cp_err[j] = sdev
        cwts[j, *] = wts
    endfor
    for j = 0, nsrc-1 do $
      quan.cp_cov += (cwts[*, j]#transpose(cwts[*, j]))*calib_src_quan[j].cp_cov
    nsrc = 1
endif

u_save =  fltarr(n_baselines, nsrc)
v_save =  fltarr(n_baselines, nsrc)
savestrings = strarr(nsrc)

;;Save these initially bad bsaelines and bispect
bad_baselines0=bad_baselines
bad_bispect0=bad_bispect
good_baselines0=good_baselines
good_bispect0=good_bispect

;;Look over source cubes for data rejection.
for asrc = 0, nsrc-1 do begin    
    ;;Firstly, start with our beginning bad baselines and bispect
    bad_baselines=bad_baselines0
    bad_bispect=bad_bispect0
    good_baselines=good_baselines0
    good_bispect=good_bispect0

    if (keyword_set(average_src) eq 1) then aquan = quan else aquan =  calib_src_quan[asrc] 
    if (keyword_set(reject_lowv2) and $
     total(aquan.v2[good_baselines]/aquan.v2_err[good_baselines] lt 1) ge 1.5) then begin
        good = where(aquan.v2[good_baselines]/aquan.v2_err[good_baselines] gt 1.5, complement=bad)
        if (bad_baselines[0] eq -1) then bad_baselines = good_baselines[bad] $ 
        else bad_baselines=[good_baselines[bad],bad_baselines]
        good_baselines = good_baselines[good]
    endif
    
    If( NOT skip_baseline_rejection ) THEN BEGIN     
;Allow for user-selected bad baselines...
        print, 'Click on bad baselines... (left of axis to exit)'
        r =  sqrt(u^2+v^2)*filter[0]
        m =  max(r)
        
        ;; Good baselines are baselines where V2 is larger than its
        ;; error
        ;;!!! Don't think this works if nothing is clicked !!!
        good_baselines =  good_baselines[where(aquan.v2[good_baselines]-aquan.v2_err[good_baselines] gt 0)]
                                ;window,1,xsize = screen_size[0]*0.9, ysize = screen_size[1]*.45 
        ploterr, [r[good_baselines]], [aquan.v2[good_baselines]], [aquan.v2_err[good_baselines]], psym = 2, xrange = [0, max(r)], $
          xtitle = 'Baseline (m)', ytitle = 'Vis Squared',  type = (1-linear_v2_cut)
        wait, 0.3
        cursor, x, y
        while (x ge 0) do begin
            dist = (x-r[good_baselines])^2/m^2 + (y-aquan.v2[good_baselines])^2
            newbad = where(dist eq min(dist), complement = newgood)
            if (bad_baselines[0] eq -1) then bad_baselines = good_baselines[newbad] else $
              bad_baselines = [good_baselines[newbad],bad_baselines]
            good_baselines = good_baselines[newgood]
            ploterr, r[good_baselines], aquan.v2[good_baselines], aquan.v2_err[good_baselines], psym = 2, $
              xtitle = 'Baseline ()', ytitle = 'Vis Squared', xrange = [0, max(r)],  type = (1-linear_v2_cut)
            wait, 0.3
            cursor, x, y
        endwhile
;Tidy-up bad vectors
        if (bad_baselines[0] ne -1 or bad_bispect[0] ne -1) then $
          add_bad,  bad_holes,  bad_baselines,  bad_bispect,  bl2h_ix,  bs2bl_ix,  good_baselines,  good_bispect
;Allow for user-selected closure-phase histogram cutoff.
        m =  median(aquan.cp_err[good_bispect])*180/!pi
        low_cutoff =  (2*m/3) < 19.9
        ;;high_cutoff =  m*4   < 20.0 ;;!!! This was bad for many many
        ;;target cubes.... everything ends up being "bad"
        high_cutoff = max(aquan.cp_err[good_bispect])*180/!pi + 1 ;
        plothist,  aquan.cp_err[good_bispect]*180/!pi,  xr = [0, 8*m],  bin = m/10,  xtit = 'CP error (degs)'
        oplot,  [low_cutoff, low_cutoff],  [0, 1000],  line = 1
        legend,['suggested lower cutoff'],line=[1],/right_leg
        print,  'Click on new error histogram lower cutoff (left of axis to accept)...'
        wait,  0.2
        if (not skip_cp_rejection) then cursor,  xL,  y else xL=-1
        if (xL gt 0) then begin
            plothist,  aquan.cp_err[good_bispect]*180/!pi,  xr = [0, 8*m],  bin = m/10,  xtit = 'CP error (degs)'
            oplot,  [high_cutoff, high_cutoff],  [0, 1000],  line = 1
            oplot,  [xL,xL], [0, 1000], line=2
            legend,['suggested upper cutoff','selected lower cutoff'],line=[1,2],/right_leg
            print,  'Click on cutoff for bad closure-phases (left of axis to accept)...'
            wait,  0.2
            if (not skip_cp_rejection) then cursor,  xU,  y else xU=-1
            if (xU gt 0) then begin
                plothist,  aquan.cp_err[good_bispect]*180/!pi,  xr = [0, 8*m],  bin = m/10,  $
                  xtit = 'CP error (degs)'
                oplot,  [high_cutoff, high_cutoff],  [0, 1000],  line = 1
                oplot,  [xL,xL], [0, 1000], line=2
                oplot,  [xU, xU],  [0, 1000],  line = 2
                  legend,['suggested upper cutoff','selected lower cutoff','selected upper cutoff'],$
                  line=[1,2,2],/right_leg
                wait,  1.0
                high_cutoff = xU
            endif
        endif
        w =  where(aquan.cp_err lt low_cutoff*!pi/180.0)
        if (w[0] ne -1) then begin
            oldcp_err = aquan.cp_err
            aquan.cp_err[w] = low_cutoff*!pi/180.0
            ratio =  aquan.cp_err/oldcp_err
            quan.cp_cov *= ratio#transpose(ratio)
        endif
        w =  where(aquan.cp_err gt high_cutoff*!pi/180.0)
        if (w[0] ne -1) then begin
            if (bad_bispect[0] ne -1) then bad_bispect =  [w,bad_bispect] else bad_bispect = w
        endif
        
;Tidy-up bad vectors
        if (bad_baselines[0] ne -1 or bad_bispect[0] ne -1) then $
          add_bad,  bad_holes,  bad_baselines,  bad_bispect,  bl2h_ix,  bs2bl_ix,  good_baselines,  good_bispect
        aquan.flag[*]=0         ;set all flags to zero initially
;Increase errors appropriately.
;Set flag to 1 as per the oifits standard, errors reverted to their original values
        if (bad_baselines[0] ne -1) then begin
            aquan.phase_err[bad_baselines] = !pi
            aquan.flag[bad_baselines] = 1
            print, 'Bad Baselines: ', bad_baselines
        endif 
        if (bad_bispect[0] ne -1) then begin
            aquan.bsflag[bad_bispect] = 1
            print, 'Bad Bispect: ', bad_bispect
        endif
    ENDIF
;Now correct the u and v coordinates for the parralactic angle.
    thepa = olog.pa[src[asrc]] - 0.5*olog.del_pa[src[asrc]] 
    u1 =  olog.uflip*u*cos(thepa*!pi/180.0)  + v*sin(thepa*!pi/180.0)
    v1 = -olog.uflip*u*sin(thepa*!pi/180.0) +  v*cos(thepa*!pi/180.0)
    u_save[*, asrc] =  u1
    v_save[*, asrc] =  v1
;______________Now save the data in lots of formats____________________
    
;1) Save in oifits
    
;;First, the oiarray: not used properly here (needs one row per hole)
;;This is dodgy because the array name
    define_oiarray, oiarray_unit
    oiarray = replicate(oiarray_unit, n_holes)
    oiarray[*].extver = 1
    oiarray[*].arrname = olog.mask + '_pa' + string(thepa, format='(f6.2)')
    oiarray[*].frame = "GEOCENTRIC"
    oiarray[*].arrayx =  10.0
    oiarray[*].arrayy =  20.0
    oiarray[*].arrayz =  30.0
    oiarray[*].tel_name = "Dummy Table"
    oiarray[*].sta_name = "Dummy Table"
    oiarray[*].diameter = 1.0
    oiarray[*].staxyz = [0., 0., 0.]
    for i=0,n_holes-1 do oiarray[i].sta_index = i
    
;Next the target star - only use 1 target star per save file.
    define_oitarget, oitarget_unit
    oitarget = replicate(oitarget_unit, 1)
    oitarget[0].target_id = 0
    oitarget[0].target = olog.source_name[src[asrc]]
    oitarget[0].raep0 = olog.ra[src[asrc]]
    oitarget[0].decep0 = olog.dec[src[asrc]]
    oitarget[0].equinox = olog.equinox[src[asrc]]
    oitarget[0].ra_err = .05
    oitarget[0].dec_err = .08
    oitarget[0].veltyp = "UNKNOWN"
    oitarget[0].veldef= "OPTICAL"
    
;Next the wavelength - only use one per save file.
    define_oiwavelength, oiwavelength_unit, nwave = 1
    oiwavelength = oiwavelength_unit
    oiwavelength.extver = 1
    oiwavelength.insname = olog.instrument[src[asrc]]
    oiwavelength.eff_wave = ptr_new(filter[0])
    oiwavelength.eff_band = ptr_new(filter[0])
    
;Next the v^2 information
    g =  good_baselines         ;Only save the data marked as `good'
    define_oivis2, oivis2_unit, nwave = 1
    oivis2 = replicate(oivis2_unit, n_elements(g))
    oivis2(*).extver = 1
    oivis2(*).date_obs = olog.date[src[asrc]]
    oivis2(*).arrname = olog.mask + '_pa' + string(thepa, format='(f6.2)')
    oivis2(*).insname = olog.instrument[src[asrc]]
    oivis2(*).target_id = 0
    oivis2(*).time = olog.utc[src[asrc]]
    oivis2(*).mjd   = olog.jd[src[asrc]]
    oivis2(*).int_time = olog.t_int[src[asrc]]
    for i =  0, n_elements(g)-1 do begin
        oivis2[i].vis2data = ptr_new(aquan.v2[g[i]])
        oivis2[i].vis2err = ptr_new(aquan.v2_err[g[i]])
        oivis2[i].flag = ptr_new(aquan.flag[i])
    endfor
    oivis2[*].ucoord    = u1[g]*filter[0]
    oivis2[*].vcoord    = v1[g]*filter[0]
    oivis2[*].sta_index  = bl2h_ix[*, g]
    
;Last, the closure phase information
    define_oit3, oit3_unit, nwave = 1
    oit3 = replicate(oit3_unit, n_bispect)
    oit3(*).extver = 1
    oit3(*).date_obs = oivis2[0].date_obs
    oit3(*).arrname = olog.mask + '_pa' + string(thepa, format='(f6.2)')
    oit3(*).insname = oivis2[0].insname
    oit3(*).target_id = oivis2[0].target_id
    oit3(*).time = oivis2[0].time
    oit3(*).mjd   = oivis2[0].mjd
    oit3(*).int_time = oivis2[0].int_time
    oit3[*].t3amp =    ptr_new(0.0)
    oit3[*].t3amperr = ptr_new(1.0)
    for i =  0,  n_bispect-1 do begin
        oit3[i].t3phi 	 = ptr_new(aquan.cp[i]*180.0/!pi)
        oit3[i].t3phierr = ptr_new(aquan.cp_err[i]*180.0/!pi)
        oit3[i].flag 	 = ptr_new(aquan.bsflag[i]) 
    endfor
    oit3[*].u1coord    = reform(u1[bs2bl_ix[0, *]]*filter[0])
    oit3[*].v1coord    = reform(v1[bs2bl_ix[0, *]]*filter[0])
    oit3[*].u2coord    = reform(u1[bs2bl_ix[1, *]]*filter[0])
    oit3[*].v2coord    = reform(v1[bs2bl_ix[1, *]]*filter[0])
    
    for i = 0, n_bispect-1 do $
      oit3(i).sta_index  = [bl2h_ix[0, bs2bl_ix[0, i]], $
                            bl2h_ix[1, bs2bl_ix[0, i]],  $
                            bl2h_ix[1, bs2bl_ix[1, i]]]
    
    source_str = olog.source_name[src[asrc]]
;First, get rid of double spaces.
    p = strpos(source_str, '  ')
    while (p gt 0) do begin
        source_str =  strmid(source_str, 0, p)+strmid(source_str, p+1)
        p = strpos(source_str, '  ')
    endwhile
;Now, replace spaces with underscores.
    p = strpos(source_str, ' ')
    while (p gt 0) do begin
        source_str =  strmid(source_str, 0, p)+'_'+strmid(source_str, p+1)
        p = strpos(source_str, ' ')
    endwhile
;Finally, get rid of any / characters and any * characters
    p = strpos(source_str, '/')
    while (p gt 0) do begin
        source_str =  strmid(source_str, 0, p)+strmid(source_str, p+1)
        p = strpos(source_str, '/')
    endwhile
    p = strpos(source_str, '*')
    while (p ge 0) do begin
        source_str =  strmid(source_str, 0, p)+strmid(source_str, p+1)
        p = strpos(source_str, '*')
    endwhile
    if (source_str ne '') then source_str =  source_str+'_'
    source_str =  source_str + olog.cube_fname[src[asrc], 1] + special
    write_oidata, dir+source_str+'.oifits', oiarray, oitarget, oiwavelength, 0, oivis2, oit3
    savestrings[asrc] = source_str
    
    
;; **** This is old Keck/NIRC style output. If you aren't Peter
;; Tuthill, Please ignore*****
    if (keyword_set(output_keckmrg)) then begin
        print,  '****** Saving in VLBMEM format *******'
        keckmrg_lambda = 1e-6   ;Actually shouldn't matter...
        w = where(bl2h_ix[0, *] eq 0)
        x_coords = v1[w]*keckmrg_lambda
        y_coords = u1[w]*keckmrg_lambda
        x_coords = [0, x_coords]
        y_coords = [0, y_coords]
        old_vis = fltarr(n_holes, n_holes)
        old_vis_err = fltarr(n_holes, n_holes)
        old_cp = fltarr(n_holes, n_holes, n_holes)
        old_cp_err = fltarr(n_holes, n_holes, n_holes)
        for i = 0, n_holes-3 do for j = i+1, n_holes-2 do for k = j+1, n_holes-1 do begin
            old_cp[i, j, k] = 180.0/!pi*(aquan.phase(h2bl_ix[i, j]) + aquan.phase(h2bl_ix[j, k]) $
                                         -  aquan.phase(h2bl_ix[i, k]))
            old_cp_err[i, j, k] = 180.0/!pi*$
              sqrt(aquan.phase_err(h2bl_ix[i, j])^2 + aquan.phase_err(h2bl_ix[j, k])^2 +  $
                   aquan.phase_err(h2bl_ix[i, k])^2)
        endfor
        for i = 0, n_holes-2 do for j = i+1, n_holes-1 do begin
            old_vis[i, j] = aquan.amp(h2bl_ix[i, j])
            old_vis_err[i, j] = aquan.amp_err(h2bl_ix[i, j])
        endfor
        x = indgen(n_holes)
        old_vis = old_vis + rotate(old_vis, 4)
        old_vis[x, x] = 1.0
        old_vis_err = old_vis_err + rotate(old_vis_err, 4)
        old_vis_err[x, x] = 0.01
        keckmrg_input_blah, x_coords, y_coords, old_vis, old_vis_err, old_cp, old_cp_err, $
          wave = keckmrg_lambda*1e6, file = dir+olog.cube_fname[src[asrc], 1]+'.input', /nofix 
    endif
endfor   ;!!! Should the next kinds of data also be concatenated ? !!!

;; If we are not averaging the source files together, then we should merge them...
if (average_src eq 0) then begin
    merge_oidata, outfile=savestrings[0]+'mrg.oifits',  infiles=savestrings+'.oifits'
    clog.primary_oifits = savestrings[0]+'mrg.oifits'
    ;;Remove all but the first target line in the target table, in order to prevent
    ;;a JMMC "SEVERE" error.
    read_oidata,  clog.primary_oifits, oiarray, oitarget,oiwavelength, oivis,oivis2,oit3
    oitarget = replicate( oitarget[0],1 )
    oiwavelength = replicate( oiwavelength[0], 1 )
    oivis2[*].target_id[*]=0
    oivis2[*].insname = oiwavelength.insname
    oit3[*].insname   = oiwavelength.insname
    oit3[*].target_id[*]=0
    write_oidata, clog.primary_oifits, oiarray, oitarget,oiwavelength, oivis,oivis2,oit3
endif else clog.primary_oifits = savestrings[0]+'.oifits'
print,  '******** Primary oifits file: ',  clog.primary_oifits
clog.outname = savestrings[0]


;-- Save complex visibilities in oifits format ----
;NB These are of course can not be used without some kind of self-cal routine!
;Next the v^2 information
;Like in Mike's original "fred" format for vis in oifits, we need to use 
;bline_reorder, and replace u,v with -u,-v whenever known_dir=1. This 
;enables some tricky imaging algorithms (older and faster versions of MACIM, 
;not released because John Monnier objected)
known_phase = where(quan.phase_err eq 0,  complement = measured_phase)
order_known_phase, bl2h_ix, known_phase, known_dir
b_order_1 = reform(bl2h_ix[0,*])
b_order_2 = reform(bl2h_ix[1,*])
new_phase = quan.phase
for j = 0,n_elements(known_phase)-1 do begin
    new_phase[known_phase[j]] = (1-2*known_dir[j])*phase[known_phase[j]]
    if (known_dir[j] eq 1) then begin
        temp = b_order_1[known_phase[j]]
        b_order_1[known_phase[j]] = b_order_2[known_phase[j]]
        b_order_2[known_phase[j]] = temp
    endif
endfor
bline_reorder = [ known_phase,  measured_phase]
known_dir =     [ known_dir,  replicate(0, n_elements(measured_phase))]

define_oivis, oivis_unit, nwave= 1
oivis=replicate(oivis_unit,n_baselines)
oivis(*).extver=1
oivis(*).date_obs=olog.date[src[0]]
oivis(*).arrname = olog.mask + '_pa' + string(thepa, format='(f6.2)')
oivis(*).insname =olog.instrument[src[0]]
oivis(*).target_id = 0
oivis(*).time = olog.utc[src[0]]
oivis(*).mjd   = olog.jd[src[0]]
oivis(*).int_time = olog.t_int[src[0]]
for i =  0, n_baselines-1 do begin
    oivis[i].visamp    = ptr_new(quan.amp[bline_reorder[i]])
    oivis[i].visamperr = ptr_new(quan.amp_err[bline_reorder[i]])
    oivis[i].visphierr = ptr_new(quan.phase_err[bline_reorder[i]]*180/!pi)  
    if (known_dir[i] eq 1) then begin
        oivis[i].visphi    = ptr_new(-quan.phase[bline_reorder[i]]*180/!pi)
        oivis[i].ucoord    = -u[bline_reorder[i]]*filter[0]
        oivis[i].vcoord    = -v[bline_reorder[i]]*filter[0]
        oivis[i].sta_index  = [bl2h_ix[1, bline_reorder[i]], bl2h_ix[0, bline_reorder[i]]]
    endif else begin
        oivis[i].visphi    = ptr_new(quan.phase[bline_reorder[i]]*180/!pi)
        oivis[i].ucoord     = u1[bline_reorder[i]]*filter[0]
        oivis[i].vcoord     = v1[bline_reorder[i]]*filter[0]
        oivis[i].sta_index  = bl2h_ix[*, bline_reorder[i]]
    endelse
endfor

write_oidata,dir+olog.cube_fname[0, 1]+'.vis.oifits',oiarray,oitarget,oiwavelength,oivis,0, 0

;_______________Pretty display: gives some idea of 2D info__________________________________________
g =  good_baselines
if (average_src ne 1) then begin
    triangulate, [u_save[g, *],-u_save[g, *]], [-v_save[g, *],v_save[g, *]], triangles
    m = max(sqrt(u[g, *]^2+v[g, *]^2))
    amp_map = trigrid([u_save[g, *],-u_save[g, *]], [-v_save[g, *],v_save[g, *]], $
                      [calib_src_quan[*].amp[g],calib_src_quan[*].amp[g]], triangles, [m/64,m/64], [-m,-m,m,m])
    phase_map = trigrid([u_save[g, *],-u_save[g, *]], [-v_save[g, *],v_save[g, *]], $
       [calib_src_quan[*].phase[g],-calib_src_quan[*].phase[g]], triangles, [m/64,m/64], [-m,-m,m,m])
endif else  begin
    triangulate, [u[g],-u[g]], [-v[g],v[g]], triangles
    m = max(sqrt(u[g]^2+v[g]^2))
    amp_map = trigrid([u[g],-u[g]], [-v[g],v[g]], [quan.amp[g],quan.amp[g]], triangles, [m/64,m/64], [-m,-m,m,m])
    phase_map = trigrid([u[g],-u[g]], [-v[g],v[g]], [quan.phase[g],-quan.phase[g]], triangles, [m/64,m/64], $
                        [-m,-m,m,m])
endelse
window,  0,  xsize = 900, ysize = 430
!p.multi = [0, 2, 1]
image_cont, amp_map, tit = 'Amplitude',  /nocont,  /asp
image_cont, phase_map, tit = 'Phase',/nocont,  /asp
!p.multi = 0
;____________Finally, save the calibrated data in an updated cubeinfo file_____________

olog.logflag =  2
clog =  make_clog(olog,  clog = clog,  bad_holes = bad_holes,  bad_baselines = bad_baselines,  $
                  bad_bispect = bad_bispect)
;;Save the calibration log in a special idlvar file:
save, clog, src, filename=dir+savestrings[0]+'.clog'
;;Save everything in the main idlvar file.
save,  olog,  plog,  clog,  framestats, quan, calib_src_quan, u_save,  v_save, u1,  v1, src, $
  filename = dir + cubeinfo_file

end
