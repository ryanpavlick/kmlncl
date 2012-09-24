;*************************************************
; kml_06.ncl
; Ryan Pavlick (http://github.com/rpavlick)
;
;  - opening, closing, writing a KML document
;  - making a GroundOverlay appear partially transparent with kmlColor
;  - adding a GroundOverlay from a gsn_csm_contour_ce plot
;  - setting certain areas transparent with kmlCropAlphaColor
;  - adding a labelbar as a ScreenOverlay
;  - adding a LookAt element
;  - creating a KMZ file 
;
;************************************************
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/kml/kml.ncl"

begin

;************************************************
; Generate an ny x nx array of random data with a minimum
; of -10 and a maximum of 110.
;************************************************

  nx = 100
  ny = 100
  z  = generate_2d_array(15,15,-10.,110.,0,(/ny,nx/))
  
;************************************************
; Generate 1D lat/lon coord arrays and attach to data. Make sure
; to include the units so we don't get warning messages from the
; gsn_csm_contour_map routine.
;************************************************

  minlat = -30
  maxlat = 20
  minlon = -70
  maxlon = 30

  lat   = fspan(minlat,maxlat,ny)
  lon   = fspan(minlon,maxlon,nx)
  z!0   = "lat"
  z!1   = "lon"
  z&lat = lat
  z&lon = lon
  z&lat@units = "degrees_north"
  z&lon@units = "degrees_east"

;************************************************
; Open workstation and define colormap.
;************************************************

  wks = gsn_open_wks("ps","mask")
  gsn_define_colormap(wks,"BlueYellowRed")

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
  
  res@cnFillOn        = True
  res@cnFillDrawOrder = "Predraw"
  res@cnLineDrawOrder = "Predraw"
  res@cnLinesOn       = False         ; turn off contour lines
  res@gsnSpreadColors = True
 
  res@mpFillOn        = True         ; fill in land areas
  res@mpLandFillColor = "white"      ; set color of filled land areas to white

;************************************************
; Create contours over a map.
;************************************************

  plot = gsn_csm_contour_map_ce(wks,z,res)

;************************************************
;  position resources for ScreenOverlay element
;************************************************

  kres = True
  kml = kml_open_document("example06", "Example 06: GroundOverlay, ScreenOverlay, LookAt",False)  

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

  lbicon = kml_crop_labelbar(kml, "label bar", wks,plot, kres)      ; crops the labelbar from the plot and converts it to a png
  kml = kml_add_screenoverlay ( kml, "Label Bar", lbicon, kres)     ; add labelbar to KML document as a ScreenOverlay element
  kml_add_kmzfile(kml,lbicon)                                       ; add cropped labelbar filename to list of files to be compressed in KMZ archive

;************************************************
;  add the map as a GroundOverlay
;************************************************

  LatLonBox = kml_get_vp_latlonbox(plot)    ; get the latlon coordinates describing the corners of the groundoverlay plot
  cropbox = kml_get_vp_cropbox(wks,plot)    ; get the page coordinates of the actual map from the plot
  delete(wks)                               ; must delete wks before cropping map

  kres@kmlCropAlphaColor = "white"          ; kml_crop_plot will now set white areas of the map to transparent
  icon = kml_crop_plot(cropbox, kres)       ; crops the groundoverlay map and converts it to png

  kres@kmlColor = "99ffffff"                                                     ; set alpha channel for overlay to make it appear partially transparent in Google Earth
  kml = kml_add_groundoverlay(kml, "GroundOverlay", icon, LatLonBox, 0, kres)    ; add cropped map to KML document as a GroundOverlay element
  kml_add_kmzfile(kml,icon)                                                      ; add cropped map filename to list of files to be compressed in KMZ archive
  delete(kres@kmlColor)
  
  kres@kmlHeading = -6                                             ; define a heading for the LookAt element
  kml = kml_add_lookat( kml, -11.0, -8.5, 0.0, 10000000, kres)     ; add a LookAt element

;************************************************
;  close, write, and archive the KML document 
;************************************************

  kml = kml_close_document(kml)    ; close the kml document
  kml_write(kml)                   ; write kml document to file "example_06.kmz"
  kml_make_kmz(kml)                ; zip kml file and overlay images together in to "example_06.kmz"

end

