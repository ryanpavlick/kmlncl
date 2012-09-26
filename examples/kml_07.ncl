;*************************************************
; kml_07.ncl
; Aditya R. Kartadikaria 2012.09.26
; based on kml_06.ncl by Ryan Pavlick
;
;  - opening, closing, writing a KML document
;  - making a GroundOverlay appear partially transparent with kmlColor
;  - adding multiple GroundOverlay elements with the TimeSpan element for an animation effect
;  - setting certain areas transparent with kmlCropAlphaColor
;  - adding a labelbar as a ScreenOverlay
;  - adding a LookAt element
;  - adding a Folder element
;  - creating a KMZ file 
;
;************************************************
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/kml/kml.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/contrib/ut_string.ncl" 

begin

;************************************************
; read in grid netCDF file
;************************************************
 grid = addfile ("examplefiles/roms_grd.nc", "r")
 lat2d  = grid->lat_rho
 lon2d  = grid->lon_rho

;************************************************
; read in netCDF file
;************************************************
 in = addfile("examplefiles/roms_avg.nc","r"); pointer to file
 x = in->zeta ; read in data
 time = in->scrum_time
 ntimes = dimsizes(time)

 ; since roms data has 2D lat/lon coordinates, we need to set these two 
 ;variables
 x@lat2d=lat2d
 x@lon2d=lon2d

  minlat = min(x@lat2d+1)
  maxlat = max(x@lat2d+1)
  minlon = min(x@lon2d+1)
  maxlon = max(x@lon2d+1)

;************************************************
; Set some resources.
;************************************************
  res                 = True

  kml_map_defaults(res) 
  ; res@mpOutlineOn     = False
  ; res@mpPerimOn       = False
  ; res@mpFillOn        = False
  ; res@mpGridAndLimbOn = False
  ; res@tmXBBorderOn    = False
  ; res@tmXTBorderOn    = False
  ; res@tmYRBorderOn    = False
  ; res@tmYLBorderOn    = False
  ; res@tmXBOn          = False
  ; res@tmXTOn          = False
  ; res@tmYROn          = False
  ; res@tmYLOn          = False
  ; res@gsnMaximize     = False


  res@mpMinLatF            =  minlat      ; range to zoom in on
  res@mpMaxLatF            =  maxlat
  res@mpMinLonF            =  minlon
  res@mpMaxLonF            =  maxlon
  res@gsnAddCyclic         =  False

;************************************************
; Set some contour resources.
;************************************************
  
  res@cnFillOn             = True
  res@cnFillDrawOrder      = "Predraw"
  res@cnLineDrawOrder      = "Predraw"
  res@cnLinesOn            = False         ; turn off contour lines
  res@cnLevelSelectionMode = "Manuallevels"
  res@cnMinLevelValF       =-0.25
  res@cnMaxLevelValF       = 0.25
  res@cnLevelSpacingF      = 0.02

  res@lbLabelAutoStride    = True
  res@lbBoxLineOn          = False
  res@gsnSpreadColors      = True
 
  res@mpFillOn                = True         ; fill in land areas
  res@mpLandFillColor         = "white"      ; set color of filled land areas to white
 ; res@mpDataBaseVersion      = "HighRes"          ; use high resolution coast

  plot_name = "mask"
  plot_type = "ps"

  wks = gsn_open_wks(plot_type,plot_name+0)        ; open workstation
  gsn_define_colormap(wks,"BlueYellowRed")

  plot = gsn_csm_contour_map_ce(wks,x(0,:,:),res)
;************************************************
;  position resources for ScreenOverlay element
;************************************************

  kres = True

;************************************************
;  position resources for ScreenOverlay element
;************************************************

  kres@kmlOverlayXY  = True
  kres@kmlOverlayXYx  = 0
  kres@kmlOverlayXYy  = 0
  kres@kmlOverlayXYxunits = "fraction" ;
  kres@kmlOverlayXYyunits = "fraction" ; pixels, or insetPixels
  kres@kmlScreenXY = True
  kres@kmlScreenXYx = 0   
  kres@kmlScreenXYy = 0
  kres@kmlScreenXYxunits = "fraction"
  kres@kmlScreenXYyunits = "fraction"


;************************************************
; add the label bar as a ScreenOverlay
;************************************************
  kml = kml_open_document("example07", "Example 07: Animated GroundOverlay",False)  

  lbicon = kml_crop_labelbar(kml, "labelbar", wks,plot, kres)      ; crops the labelbar from the plot and converts it to a png
  kml = kml_add_screenoverlay ( kml, "Label Bar", lbicon, kres)     ; add labelbar to KML document as a ScreenOverlay element
  kml_add_kmzfile(kml,lbicon)                                       ; add cropped labelbar filename to list of files to be compressed in KMZ archive

  kml = kml_add_lookat( kml, 19, -32, 0.0, 4616152, kres)           ; add a LookAt element

  kml_folder = kml_open_folder(kml, "GroundOverlay Folder",False)   ; put all GroundOverlay elements in one folder

do i=1,ntimes-1

;************************************************
; Open workstation and define colormap.
;************************************************
  wks = gsn_open_wks(plot_type,plot_name+i)        ; open workstation
  gsn_define_colormap(wks,"BlueYellowRed")

;************************************************
; Create contours over a map.
;************************************************

  plot = gsn_csm_contour_map_ce(wks,x(i,:,:),res)

;************************************************
;  add the map as a GroundOverlay
;************************************************

  LatLonBox = kml_get_vp_latlonbox(plot)    ; get the latlon coordinates describing the corners of the groundoverlay plot
  cropbox = kml_get_vp_cropbox(wks,plot)    ; get the page coordinates of the actual map from the plot
  delete(wks)                               ; must delete wks before cropping map

;************************************************
;   dating format to kml
;************************************************

 dum_time1=time(i-1)
 dum_time1@units="seconds since 1980-1-1 00:00:0.0"
 utc_date1= ut_calendar(dum_time1,0)
 year1 = tointeger(utc_date1(:,0))
 month1= tointeger(utc_date1(:,1))
 day1  = tointeger(utc_date1(:,2))
 hour1 = tointeger(utc_date1(:,3))
 mins1 = tointeger(utc_date1(:,4))
 sec1  = utc_date1(:,5)

 dum_time2=time(i)
 dum_time2@units="seconds since 1980-1-1 00:00:0.0"
 utc_date2= ut_calendar(dum_time2,0)
 year2 = tointeger(utc_date2(:,0))
 month2= tointeger(utc_date2(:,1))
 day2  = tointeger(utc_date2(:,2))
 hour2 = tointeger(utc_date2(:,3))
 mins2 = tointeger(utc_date2(:,4))
 sec2  = utc_date1(:,5)

 format = "%Y-%N-%DT%H:%MZ"    ; format for ut_string timestamp

 timeDouble1 = ut_inv_calendar( year1, month1, day1, hour1, mins1, sec1,  "seconds since 1980-01-01 00:00", 0 )
 timeDouble2 = ut_inv_calendar( year2, month2, day2, hour2, mins2, sec2,  "seconds since 1980-01-01 00:00", 0 )

 stimebegin  = ut_string(timeDouble1,format)
 stimeend    = ut_string(timeDouble2,format)

 kres@kmlTimeSpanBegin = stimebegin         ; set a begin time for the timespan element
 kres@kmlTimeSpanEnd   = stimeend           ; set an end time for the timespan element

  kres@kmlCropAlphaColor = "white"          ; kml_crop_plot will now set white areas of the map to transparent
  icon = kml_crop_plot(cropbox, kres)       ; crops the groundoverlay map and converts it to png

  kres@kmlColor = "bbffffff"                                                     ; set alpha channel for overlay to make it appear partially transparent in Google Earth
  kml = kml_add_groundoverlay(kml, "GroundOverlay", icon, LatLonBox, 0, kres)    ; add cropped map to KML document as a GroundOverlay element
  kml_add_kmzfile(kml,icon)                                                      ; add cropped map filename to list of files to be compressed in KMZ archive
  delete(kres@kmlColor)

end do

;************************************************
;  close, write, and archive the KML document 
;************************************************
  kml_folder=kml_close_folder(kml) ; close the folder
  kml = kml_close_document(kml)    ; close the kml document
  kml_write(kml)                   ; write kml document to file "example_07.kmz"
  kml_make_kmz(kml)                ; zip kml file and overlay images together in to "example_07.kmz"

end


