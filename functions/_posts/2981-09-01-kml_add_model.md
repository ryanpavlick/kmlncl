---
    layout: function
    title: kml_add_model
    short: Adds a 3D COLLADA model to a KML document
    category: functions  
    tags: geometry
---

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

function kml_add_model (
  kml:string,
  name:string,
  link:string,
  x[1]:float,
  y[1]:float,
  z[1]:float,
  res:logical
)

returnval [*]  :  string
</code></pre>

### Arguments
*kml*

A string array containing a KML document and associated attributes created with the function [kml_open_document]({{site.base_url}}/functions/kml_open_document.html).

*name*

Text string displayed in Google Earth (or other geobrowser) as the label for the Model.

*link*

short description of link

*x*, *y*, *z*

Scalars defining the latitude, longitude, and altitude of the Model element.

*res*

A variable containing an optional list of [KML resources](resources), attached as attributes. Set to True if you want the attached attributes to be applied, and False if you either don't have any resources to set, or you don't want the resources applied.

### Return value

A string array containing a KML document with a Model element appended to the end.

### Description

For more information about the Model element, see the [Google KML Reference](https://developers.google.com/kml/documentation/kmlreference#model) page or the [OGC KML specification](http://www.opengeospatial.org/standards/kml/).

### See Also

{% for seealso in page.seealso %}
[{{seealso}}]({{site.base_url}}/functions/{{seealso}}.html)
{% endfor %}

### Examples


