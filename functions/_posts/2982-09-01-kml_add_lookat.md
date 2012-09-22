---
    layout: function
    title: kml_add_lookat
    short: Adds a LookAt element to a KML document.
    category: functions  
    tags: abstract
    seealso: [ kml_add_camera ]
---

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

function kml_add_lookat (
  kml:string,
  x[1]:float,
  y[1]:float,
  z[1]:float,
  range[1]:float,
  res:logical
)

returnval [*]  :  string
</code></pre>

### Arguments
*kml*

A string array containing a KML document and associated attributes created with the function [kml_open_document]({{site.base_url}}/functions/kml_open_document.html).

*x*, *y*, *z*

Scalars defining the latitude, longitude, and altitude of the LookAt element.

*range*

Distance in meters from the point specified by *x*, *y*, and *z* to the LookAt position.
  
*res*

A variable containing an optional list of [KML resources]({{site.base_url}}/resources), attached as attributes. Set to True if you want the attached attributes to be applied, and False if you either don't have any resources to set, or you don't want the resources applied.

### Return value

A string array containing a KML document with a LookAt element appended to the end.

### Description

For more information about the LookAt element, see the [Google KML Reference](https://developers.google.com/kml/documentation/kmlreference#lookat) page or the [OGC KML specification](http://www.opengeospatial.org/standards/kml/).

### See Also

{% for seealso in page.seealso %}
[{{seealso}}]({{site.base_url}}/functions/{{seealso}}.html)
{% endfor %}

### Examples


