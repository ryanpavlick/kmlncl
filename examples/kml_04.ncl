;*************************************************
; kml_04.ncl
; Ryan Pavlick (http://github.com/rpavlick)
; 
; Concepts illustrated:
;  - opening, closing, writing a KML document
;  - adding a Placemark element containing Model elements
;  - creating a kmz file
;
;*************************************************

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/kml/kml.ncl"
  
  x = -96.0195      ; longitude of first wind turbine model
  y = 40.0088       ; latitude of first wind turbine model
  z = 0.            ; altitude of first wind turbine model
  
  ; open new kml document
  kml = kml_open_document("example04", "Example 04: Adding 3D COLLADA models",False)   
  
  ; zoom in to 347 meters altitude near wind farm
  kres = True
  kres@kmlTilt = 60   ; tilt camera 60 degrees
  kres@kmlHeading = 10;
  kml = kml_add_camera ( kml, x, y-0.005, 347, kres)
  delete(kres@kmlTilt)
  
  ; set some kml resources for kml_add_model
  kres@kmlScaleX = 3
  kres@kmlScaleY = 3
  kres@kmlScaleZ = 3
  
  ; open a Placemark element
  kml = kml_open_placemark(kml, "Wind Farm", kres) 

  ; add several wind turbine Model elements in an array pattern
  do i = 0, 3
    do j = 0, 3
  
      ; add a wind turbine model
      kml = kml_add_model(kml, "Wind Turbine", "examplefiles/models/model.dae", x, y, z, kres) 
    
      y = y + 0.0020

    end do
    y = 40.0088
    x = x + 0.0020
  end do
  
  ; close Placemark element
  kml = kml_close_placemark(kml)
  
  ; add wind turbine model dae file to list of files for creating kmz
  kml_add_kmzfile(kml,"examplefiles/models/model.dae")
  kml_add_kmzfile(kml,"examplefiles/images/*")
    
  kml = kml_close_document(kml)  ; close kml document
  kml_write(kml)                 ; write kml document to file example04.kml
  kml_make_kmz(kml)              ; zip kml file and overlay images together in example04.kmz
  

