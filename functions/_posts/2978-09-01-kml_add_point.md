---
    layout: function
    title: kml_add_point
    short: Adds a Point element to a KML document
    category: functions  
    tags: geometry
    seealso: [ kml_open_placemark, kml_add_linestring ]
---

{{ page.element}}

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

function kml_add_point (
  kml:string,
  x[1]:float,
  y[1]:float,
  z[1]:float,
  res:logical
)

returnval [*]  :  string
</code></pre>

### Arguments
*kml*

A string array containing a KML document. This string array is created by calling [kml_open_document](kml_open_document.html).

*x*,*y*,*z*

One-dimensional arrays containing the longitude, latitude, and altitude coordinates of the Point element

*res*

A variable containing an optional list of [KML resources]({{site.url}}/resources), attached as attributes. Set to True if you want the attached attributes to be applied, and False if you either don't have any resources to set, or you don't want the resources applied.

### Return value

A string array containing a KML document with a LinearRing element appended to the end.

### Description

### See Also

{% for seealso in page.seealso %}
[{{seealso}}]({{site.url}}/functions/{{seealso}}.html)
{% endfor %}

### Examples


