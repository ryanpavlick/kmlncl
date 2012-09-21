---
    layout: function
    title: kml_add_photooverlay
    short: Adds a PhotoOverlay element to a KML document.
    category: functions
    tags: overlay
    seealso: [ kml_plot_groundoverlay, kml_add_screenoverlay, kml_plot_screenoverlay ]
---

# NOT WORKING YET #

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

function kml_add_photooverlay (
  kml:string,
  name:string,
  icon:string,
  x[1]:float,
  y[1]:float,
  z[1]:float,
  res:logical
)

returnval [*]  :  string
</code></pre>

### Arguments
*kml*

A string array containing a KML document and associated attributes created with the function [kml_open_document](functions/kml_open_document.html).

*name*

Text string displayed in Google Earth (or other geobrowser) as the label for PhotoOverlay.

*icon*

An HTTP address or a local file specification used to load the PhotoOverlay image.

*x*,*y*,*z*

The latitude, longitude, and altitude coordinates determining where to draw the icon marking the position of the PhotoOverlay.

*res*

A variable containing an optional list of [KML resources](resources), attached as attributes. Set to True if you want the attached attributes to be applied, and False if you either don't have any resources to set, or you don't want the resources applied.

### Return value

A string array containing a KML document with a PhotoOverlay element appended to the end.

### Description

For more information about the PhotoOverlay element, see the [Google KML Reference](https://developers.google.com/kml/documentation/kmlreference#photooverlay) page or the [OGC KML specification](http://www.opengeospatial.org/standards/kml/).

### See Also

{% for seealso in page.seealso %}
[{{seealso}}](functions/{{seealso}}.html)
{% endfor %}

### Examples


