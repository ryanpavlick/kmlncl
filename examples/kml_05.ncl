;*************************************************
; kml_05.ncl
; Ryan Pavlick (http://github.com/rpavlick)
;
; Concepts illustrated:
;  - opening, closing, writing a KML document
;  - adding a GroundOverlay from gsn_csm_contour_ce plot
;  - adding a labelbar as a ScreenOverlay
;  - creating a KMZ file
;
;*************************************************

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/kml/kml.ncl"

;************************************************
; read in netCDF file
;************************************************
  a = addfile("$NCARG_ROOT/lib/ncarg/data/cdf/uv300.nc","r")

;************************************************
; read in data from netcdf
;************************************************
  x = a->V(0,:,:)

;************************************************
; create plot
;************************************************

  plot_type = "ps"        ; plot type must be postscript
  plot_name = "uv300"     ; name of groundoverlay icon file

  wks = gsn_open_wks(plot_type,plot_name)        ; open workstation
  gsn_define_colormap(wks,"BlAqGrYeOrRe")        ; choose colormap

  res                 = True

  kml_map_defaults(res)   ; set following suggested default plotting resources
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

  res@gsnSpreadColors = True          ; use full range of color map
  res@cnLevelSpacingF = 0.5           ; contour spacing
  res@cnFillOn        = True          ; turn on color fill
  res@cnFillMode      = "RasterFill"
  res@cnLinesOn       = False         ; turn off contour lines

  ; plot the groundoverlay map
  plot = gsn_csm_contour_map_ce(wks,x,res)

  kres = True

  ; open a new KML document
  kml = kml_open_document("example05", "Example 05: GroundOverlay, ScreenOverlay",kres)    ; open new kml document

  ; position resources for ScreenOverlay element
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

  ; crops the labelbar from the plot and converts it to a png
  lbicon = kml_crop_labelbar(kml, "label bar", wks,plot, kres)

  ; add labelbar to KML document as a ScreenOverlay element
  kml = kml_add_screenoverlay ( kml, "Label Bar", lbicon, kres )

  ; add cropped labelbar filename to list of files to be compressed in KMZ archive
  kml_add_kmzfile(kml,lbicon)

  ; get the latlon coordinates describing the corners of the groundoverlay plot
  LatLonBox = kml_get_vp_latlonbox(plot)

  ; get the page coordinates of the actual map from the plot
  cropbox = kml_get_vp_cropbox(wks,plot)

  ; "delete(wks)" can not be called within a function, need to find a work around for this
  delete(wks)

  ; crops the groundoverlay map and converts it to png
  ; must "delete(wks)" before this command
  icon = kml_crop_plot(cropbox, False)

  ; add cropped map to KML document as a GroundOverlay element
  kml = kml_add_groundoverlay(kml, "GroundOverlay", icon, LatLonBox, 0, kres)

  ; add cropped map filename to list of files to be compressed in KMZ archive
  kml_add_kmzfile(kml,icon)

  ; close kml document
  kml = kml_close_document(kml)

  ; write kml document to file "example05.kml"
  kml_write(kml)

  ; zip kml file and overlay images together in to "example05.kmz"
  kml_make_kmz(kml)

exit
