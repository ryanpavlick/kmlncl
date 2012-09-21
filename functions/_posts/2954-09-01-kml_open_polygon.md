---
    layout: function
    title: kml_open_polygon
    short: Adds an open Polygon element in a KML document.
    category: functions  
    tags: geometry
    seealso: [kml_close_polygon, kml_add_polygon_inner, kml_add_polygon_outer, kml_open_placemark]
---

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

function kml_open_polygon (
  kml:string,
  res:logical
)

returnval [*]  :  string
</code></pre>

### Arguments
*kml*

A string array containing a KML document and associated attributes created with the function [kml_open_document]({{site.base_url}}functions/kml_open_document.html).

*res*

A variable containing an optional list of [KML resources](resources), attached as attributes. Set to True if you want the attached attributes to be applied, and False if you either don't have any resources to set, or you don't want the resources applied.

### Return value

A string array containing a KML document with an open Polygon element appended to the end.

### Description

For more information about the Polygon element, see the [Google KML Reference](https://developers.google.com/kml/documentation/kmlreference#polygon) page or the [OGC KML specification](http://www.opengeospatial.org/standards/kml/).

### See Also

{% for seealso in page.seealso %}
[{{seealso}}]({{site.base_url}}functions/{{seealso}}.html)
{% endfor %}

### Examples


