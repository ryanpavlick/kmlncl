;*************************************************
; kml_01.ncl
; Ryan Pavlick (http://github.com/rpavlick)
;
; Concepts illustrated:
;   - Opening and closing a KML document
;   - Adding a Placemark element containing a Point element
;   - Writing a KML document to a file
;
;************************************************

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "../kml/kml.ncl"

begin
;************************************************

kmlfilename = "example01"

kml = kml_open_document(kmlfilename, "A KML of Two Cities", False)  ; open a new KML document

  kml = kml_open_placemark(kml, "Eiffel Tower", False)              ; open a Placemark element
    kml = kml_add_point(kml,2.2946,48.8584,0.0,False)               ; add a Point geometry element
  kml = kml_close_placemark(kml)                                    ; close the Placemark element

  kml = kml_open_placemark(kml, "Big Ben", False)                   ; open a second  Placemark element
    kml = kml_add_point(kml,-0.1246,51.5006,0.0,False)              ; add a Point geometry element
  kml = kml_close_placemark(kml)                                    ; close the Placemark element

kml = kml_close_document(kml)                                       ; close the KML document

kml_write(kml)                                                      ; write the KML document to file "example01.kml"

;************************************************
end
