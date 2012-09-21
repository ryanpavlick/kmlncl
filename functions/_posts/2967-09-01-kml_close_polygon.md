---
    layout: function
    title: kml_close_polygon
    short: Closes an open Polygon element in a KML document.
    category: functions
    tags: geometry
    seealso: [kml_open_polygon, kml_add_polygon_inner, kml_add_polygon_outer, kml_open_placemark]
---

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

function kml_close_polygon (
  kml:string
)

returnval [*]  :  string
</code></pre>

### Arguments
*kml*

A string array containing a KML document and associated attributes created with the function [kml_open_document]({{site.base_url}}functions/kml_open_document.html).

### Return value

Returns a string array containing a KML document with a ``</Polygon>`` tag appended to the end.

### Description

For more information about the Polygon element, see the [Google KML Reference](https://developers.google.com/kml/documentation/kmlreference#polygon) page or the [OGC KML specification](http://www.opengeospatial.org/standards/kml/).

### See Also

{% for seealso in page.seealso %}
[{{seealso}}]({{site.base_url}}functions/{{seealso}}.html)
{% endfor %}

### Examples


