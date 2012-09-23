;*************************************************
; kml_03.ncl
; Ryan Pavlick (http://github.com/rpavlick)
; 
; Concepts illustrated:
;  - opening, closing, writing a KML document
;  - adding NetworkLink element
;  - styling a text balloon with the BalloonStyle element
;
;*************************************************

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/kml/kml.ncl"

;*************************************************
;   open a new kml document
;*************************************************

  kml = kml_open_document("example03", "NetworkLink Example",False)    ; open new kml document

;*************************************************
; set some KML resources for Style element
;*************************************************

  kres = True

  kres@kmlID      = "exampleballoonstyle"       ; set an ID for this Style
  kres@kmlBgColor = "ffffffbb"                  ; set text balloon background color to light blue
  
  kml = kml_open_style(kml,kres)       ; add Style element with id exampleballoonstyle
  kml = kml_add_balloonstyle(kml,kres) ; add BalloonStyle element with bgColor=ffffffbb
  kml = kml_close_style(kml)           ; close Style element
  
  delete(kres@kmlID)       
              
;*************************************************
; set kml resources for NetworkLink element
;*************************************************

  kres@kmlDescription = "MODIS Hotspots for South America. <br><br> For more information, visit FIRMS home page @ <a href=" + \
                         kml@quote + "https://earthdata.nasa.gov/data/nrt-data/firms" + kml@quote + \
                         ">https://earthdata.nasa.gov/data/nrt-data/firms</a>"
  kres@kmlRefreshInterval = 7200
  kres@kmlRefreshMode     = "onInterval"
  kres@kmlFlyToView       = 1                        
  kres@kmlStyleUrl        = "#exampleballoonstyle"   ; refer to Style element defined above
  
;*************************************************
;   add a NetworkLink element pointing to a kml document on a remote server
;*************************************************

    kml = kml_add_networklink (kml, "South America 24h MODIS Hotspots", "http://firms.modaps.eosdis.nasa.gov/active_fire/kml/South_America_24h.kml", kres )

;*************************************************
;   close kml document
;*************************************************

    kml = kml_close_document(kml) 

;*************************************************
;   write kml document to file example03.kml
;*************************************************

    kml_write(kml)   

