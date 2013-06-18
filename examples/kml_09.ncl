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
	load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
	load "../kml/kml.ncl"
	load "$NCARG_ROOT/lib/ncarg/nclscripts/contrib/ut_string.ncl" 


	;************************************************
	; read in IBTrACS netCDF file
	;************************************************

	inFile = addfile ("examplefiles/Year.2005.ibtracs_wmo.v03r04.nc", "r")

	year = 2005 
	basin = 0 ;; -1=All, 0=North Atlantic, 1=South Atlantic, 2=West Pacific,
	;; 3=East Pacific, 4=South Pacific, 5=North Indian, 6=South Indian

	timeUnits = "days since 1858-11-17 00:00:00"
	kml_timeformat = "%Y-%N-%DT%H:%MZ"    ; format for ut_string timestamp


	;;****************************************************************
	;; Read the data
	;;****************************************************************

	stormYear = inFile->season
	stormBasin = inFile->genesis_basin
	if( basin.ge.0 ) then
	stormInd = ind( ( year.eq.stormYear ).and.( basin.eq.stormBasin ) )
	else
	stormInd = ind( year.eq.stormYear )
	end if
	stormLat = short2flt( inFile->lat_wmo(stormInd,:) )
	stormLon = short2flt( inFile->lon_wmo(stormInd,:) )
	stormTime =  inFile->time_wmo(stormInd,:) 
	stormLon = where( stormLon.lt.0, stormLon+360, stormLon )
    stormNames = inFile->name





	;************************************************
	; create default plot
	;************************************************


	kmlfilename = "example09"

	kml = kml_open_document(kmlfilename, "Tropical cyclone tracks", False)    ; open a new KML document
	kml_folder = kml_open_folder(kml, "North Atlantic basin",False)   



	nStorm = dimsizes(stormInd)

	do i = 0,nStorm-1

	nTime =  num(.not.ismissing(stormTime(i,:)))

	times := new(nTime,string,"No_FillValue")
	do j = 0,nTime-1
	times(j)  = ut_string(stormTime(i,j),kml_timeformat)
	end do
	print(times)

	y := stormLat(i,0:nTime-1)
	x := stormLon(i,0:nTime-1)
	z := x
	z = 0.0
    stormName := chartostring(stormNames(i,:))
	kml = kml_open_placemark(kml, stormName, False)           ; open a Placemark element

	kml = kml_add_gxTrack(kml,x,y,z, times, False)       
	kml = kml_close_placemark(kml)                              ; close the Placemark element
	
end do







	kml = kml_close_folder(kml)                               ; close the KML document
	kml = kml_close_document(kml)                               ; close the KML document

	kml_write(kml)                                              ; write the KML document to file "example08.kml"
	kml_make_kmz(kml)                ; zip kml file in to "example_08.kmz"

