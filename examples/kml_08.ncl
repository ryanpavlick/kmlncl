;*************************************************
; kml_08.ncl
; Ryan Pavlick (http://github.com/rpavlick)
;
; Concepts illustrated:
;   - Opening and closing a KML document
;   - Extracting isolines from a contour plot
;   - Adding a Placemark element containing LineString elements
;   - Writing a KML document to a file
;
;************************************************


 load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
 load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
 load "$NCARG_ROOT/lib/ncarg/nclscripts/kml/kml.ncl"
 
 ;************************************************
 ; read in netCDF file
 ;************************************************
   a = addfile("$NCARG_ROOT/lib/ncarg/data/cdf/uv300.nc","r")
 ;************************************************
 ; read in zonal winds
 ;************************************************
   u = a->U(1,:,:)                                ; read July zonal winds
 ;************************************************
 ; create default plot
 ;************************************************
   wks = gsn_open_wks("pdf","ce")                  ; open a ps file
  res = True

   plot = gsn_csm_contour_map_ce(wks,u,res)     ; create a default plot

  kmlfilename = "example08"

  kml = kml_open_document(kmlfilename, "Isolines", False)    ; open a new KML document
  kml = kml_open_placemark(kml, "Isolines", False)           ; open a Placemark element

; the following loops are taken from example 1 of ncl documentation for function get_isolines
; http://www.ncl.ucar.edu/Document/Functions/Built-in/get_isolines.shtml

   isolines = get_isolines(plot@contour,"plot")
 
  do i = 0, ListCount(isolines) - 1
      iso := isolines[i]
      count = 0
      do j = 0, iso@segment_count -1
          b = iso@start_point(j)
          e = b + iso@n_points(j) - 1
          y := iso(0,b:e)
          x := iso(1,b:e)
          z := iso(1,b:e) * 0.0
            kml = kml_add_linestring(kml,x,y,z,False)        ; add KML linestring containing isoline segment
          count = count + iso@n_points(j)
      end do
      print(iso@level + " has " + count + " total points in " + iso@segment_count + " segments" )
  end do
  
  kml = kml_close_placemark(kml)                              ; close the Placemark element

  kml = kml_add_lookat( kml, -67.55, 31.5, 0.0, 19492000.0, False)     ; add a LookAt element

  kml = kml_close_document(kml)                               ; close the KML document

  kml_write(kml)                                              ; write the KML document to file "example08.kml"
  kml_make_kmz(kml)                ; zip kml file in to "example_08.kmz"


