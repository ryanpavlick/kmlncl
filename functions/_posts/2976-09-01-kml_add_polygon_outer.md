---
    layout: function
    title: kml_add_polygon_outer
    short: Adds a LinearRing element defining the outer boundary of a Polygon element.
    category: functions  
    tags: geometry
    seealso: [kml_open_polygon, kml_add_polygon_inner, kml_close_polygon, kml_open_placemark]
---

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

function kml_add_polygon_inner (
  kml:string,
  x[*]:numeric,
  y[*]:numeric,
  z[*]:numeric,
  res:logical
)

returnval [*]  :  string
</code></pre>

### Arguments
*kml*

A string array containing a KML document and associated attributes created with the function [kml_open_document]({{site.base_url}}functions/kml_open_document.html).

*x*,*y*,*z*

One-dimensional arrays containing the longitude, latitude, and altitude coordinates of defining the outer boundary of a Polygon element. The dimensions of *x*,*y*, and *z* must be equal.

*res*

A variable containing an optional list of [KML resources](resources), attached as attributes. Set to True if you want the attached attributes to be applied, and False if you either don't have any resources to set, or you don't want the resources applied.

### Return value

A string array containing a KML document with a LinearRing element appended to the end.

### Description

For more information about the Polygon element, see the [Google KML Reference](https://developers.google.com/kml/documentation/kmlreference#polygon) page or the [OGC KML specification](http://www.opengeospatial.org/standards/kml/).

### See Also

{% for seealso in page.seealso %}
[{{seealso}}]({{site.base_url}}functions/{{seealso}}.html)
{% endfor %}

### Examples


