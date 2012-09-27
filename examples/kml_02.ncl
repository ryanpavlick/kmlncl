;**************************************************
; kml_02.ncl
; Ryan Pavlick (http://github.com/rpavlick)
;
; Based on NCL example script polyg_1.ncl by Mark Stevens
;
; Concepts illustrated:
;   - Opening and closing a KML document
;   - Adding a Polygon elements 
;   - Styling Polygon elements with the PolyStyle element
;   - Writing a KML document to a file
;
;
;**************************************************
; based on polyg_1.ncl written by Mark Stevens 07/07/00
; plots polygons defined by climate divisions
;*************************************************

;*************************************************
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/kml/kml.ncl"

; load the netcdf containing US climate divisions
  fname = "$NCARG_ROOT/lib/ncarg/data/cdf/climdiv_polygons.nc"
  ncdf = addfile(fname,"r")
 
;************************************************
; some parameters
;************************************************
  statenames = new((/48/),"string")
  statenames = (/"AL","AR","AZ","CA","CO","CT","DE","FL","GA","IA","ID","IL", \
               "IN","KS","KY","LA","MA","MD","ME","MI","MN","MO","MS","MT", \
               "NC","ND","NE","NH","NJ","NM","NV","NY","OH","OK","OR","PA", \
               "RI","SC","SD","TN","TX","UT","VA","VT","WA","WI","WV","WY"/) 

; climate divisions in each state                   
  ncds = new((/48/),"integer")
  ncds = (/8,9,7,7,5,3,2,6,9,9,10,9,9,9,4,9,3,8,3,10,9,6,10,7, \
         8,9,8,2,3,8,4,10,10,9,9,10,1,7,9,4,10,7,7,3,10,9,6,10/)
         
  npoly = sum(ncds)   ; number of polygons to draw

  kmlfilename = "example02"

  kml = kml_open_document(kmlfilename, "US Climate Divisions", False)  ; open a new KML document
  
; set some KML resources
  kres = True
  kres@kmlTessellate = 1
  kres@kmlExtrude = 0
  kres@kmlAltitudeMode = "clampToGround"

;*********************************************
; and fill polygons with random colors
; using the PolyStyle element
;*********************************************

  kres@kmlID = "polygonstyle"      ; set the ID for the Style element
  kres@kmlColorMode = "random"     ; fill the polygons with random colors
  kres@kmlColor = "ffffffff"
  kres@kmlFill = 1                 ; polygons should be filled
  kres@kmlOutline = 1              ; draw polygon borders
  
  kml = kml_open_style(kml,kres)                           ; open a Style element
  kml = kml_add_polystyle(kml, kres)                       ; add a PolyStyle element
  kml = kml_close_style(kml)                               ; close Style element
  delete(kres@kmlID)

  do st = 1, 48
    do cd = 1, ncds(st-1)
      varstr = statenames(st-1)+"_CD"+cd     ; get the polygon data
      x = ncdf->$varstr$@lon                 ; get lon stored in attribute
      y = ncdf->$varstr$@lat                 ; get lat stored in attribute

      ; set the altitude coordinates to zero
      z = y
      z = 0.0
      
      kres@kmlStyleUrl = "#polygonstyle"                       ; refer to PolyStyle element added above
      kml = kml_open_placemark(kml, varstr, kres)              ; open a Placemark element
        kml = kml_open_polygon(kml,kres)                       ; open a Polygon element
        kml = kml_add_polygon_outer(kml,x,y,z,kres)            ; add a Polygon outer ring
        kml = kml_close_polygon(kml)                           ; close the Polygon element 
      kml = kml_close_placemark(kml)                           ; close the Placemark element

      ; delete some variables before the next iteration of the loop
      delete(varstr)
      delete(x)
      delete(y)
      delete(z)
    end do
  end do

  kml = kml_close_document(kml)     ; close the KML document

  kml_write(kml)                    ; write KML document to file "example02.kml"
  kml_make_kmz(kml)
;********************************************
