---
    layout: function
    title: kml_add_linestring
    short: Adds a LineString element to a KML document.
    category: functions
    tags: geometry
    seealso: [ kml_add_linestyle, kml_open_placemark, kml_add_linearring ]
---

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

function kml_add_linestring (
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

A string array containing a KML document and associated attributes created with the function [kml_open_document]({{site.url}}/functions/kml_open_document.html).

*x*,*y*,*z*

One-dimensional arrays containing the longitude, latitude, and altitude coordinates of the LineString element. The dimensions of *x*,*y*, and *z* must be equal.

*res*

A variable containing an optional list of [KML resources]({{site.url}}/resources), attached as attributes. Set to True if you want the attached attributes to be applied, and False if you either don't have any resources to set, or you don't want the resources applied.

### Return value

A string array containing a KML document with a LineString element appended to the end.

### Description

For more information about the LineString element, see the [Google KML Reference](https://developers.google.com/kml/documentation/kmlreference#linestring) page or the [OGC KML specification](http://www.opengeospatial.org/standards/kml/).

### See Also

{% for seealso in page.seealso %}
[{{seealso}}]({{site.url}}/functions/{{seealso}}.html)
{% endfor %}

### Examples


