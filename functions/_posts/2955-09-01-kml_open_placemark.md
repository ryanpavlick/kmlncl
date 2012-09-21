---
    layout: function
    title: kml_open_placemark
    short: Adds an open Placemark element to a KML document.
    category: functions  
    tags: feature
    seealso: [kml_close_placemark, kml_add_point]
---

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

function kml_open_placemark (
  kml:string,
  name:string,
  res:logical
)

returnval [*] : string
</code></pre>

### Arguments
*kml*

A string array containing a KML document and associated attributes created with the function [kml_open_document](functions/kml_open_document.html).

*name*

Text string displayed in Google Earth (or other geobrowser) as the label for the Placemark.

*res*

A variable containing an optional list of [KML resources](resources), attached as attributes. Set to True if you want the attached attributes to be applied, and False if you either don't have any resources to set, or you don't want the resources applied.

### Return value

A string array containing a KML document with an open Folder element appended to the end.

### Description

A Placemark is a Feature element which can be added to a KML document with the function [kml_open_placemark](functions/kml_open_placemark.html). Zero or more Geometry elements may be placed inside a Placemark element (e.g. by adding Point elements with the function [kml_add_point](functions/kml_add_point.html)). Once all desired Geometry elements have been added, the Placemark element must be closed with the function [kml_close_placemark](functions/kml_close_placemark.html).

For more information about the Placemark element, see the [Google KML Reference](https://developers.google.com/kml/documentation/kmlreference#placemark) page or the [OGC KML specification](http://www.opengeospatial.org/standards/kml/).

### See Also

{% for seealso in page.seealso %}
[{{seealso}}](functions/{{seealso}}.html)
{% endfor %}

### Examples


