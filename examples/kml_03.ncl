;*************************************************
; kml_03.ncl
; Ryan Pavlick (http://github.com/rpavlick)
; 
; Concepts illustrated:
;  - opening, closing, writing a KML document
;  - adding NetworkLink element
;
;*************************************************

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "../kml/kml.ncl"

;*************************************************
;   open a new kml document
;*************************************************

    kml = kml_open_document("example03", "NetworkLink Example",False)    ; open new kml document

;*************************************************
; set some kml resources
;*************************************************

  kres = True
  kres@kmlDescription = "<![CDATA[MODIS Hotspots for South America. <br><br> For more information, visit FIRMS home page @ <a href=" + \
                         kml@quote + "https://earthdata.nasa.gov/data/nrt-data/firms" + kml@quote + \
                         ">https://earthdata.nasa.gov/data/nrt-data/firms</a> ]]>"
  kres@kmlRefreshInterval = 7200
  kres@kmlRefreshMode     = "onInterval"
  kres@kmlFlyToView       = 1
  
;*************************************************
;   add a NetworkLink to a kml document on a remote server
;*************************************************

    kml =  kml_add_networklink (kml, "South America 24h MODIS Hotspots", "http://firms.modaps.eosdis.nasa.gov/active_fire/kml/South_America_24h.kml", kres )

;*************************************************
;   close kml document
;*************************************************

    kml = kml_close_document(kml) 

;*************************************************
;   write kml document to file example03.kml
;*************************************************

    kml_write(kml)   

