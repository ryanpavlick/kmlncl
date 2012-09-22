---
    layout: function
    title: kml_close_placemark
    short: Closes an open Placemark element in a KML document.
    category: functions
    tags: feature
    seealso: kml_open_placemark
    examples: kml_01
---

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

function kml_close_placemark (
  kml:string
)

returnval [*]  :  string
</code></pre>

### Arguments
*kml*

A string array containing a KML document created with the function [kml_open_document]({{site.base_url}}/functions/kml_open_document.html).

### Return value

Returns a string array containing a KML document with a ``</Placemark>`` tag appended to the end.

### Description

A Placemark is a Feature element which can be added to a KML document with the function [kml_open_placemark]({{site.base_url}}/functions/kml_open_placemark.html). Zero or more Geometry elements may be placed inside a Placemark element (e.g. by adding Point elements with the function [kml_add_point]({{site.base_url}}/functions/kml_add_point.html)). Once all desired Geometry elements have been added, the Placemark element must be closed with the function [kml_close_placemark]({{site.base_url}}/functions/kml_close_placemark.html).

For more information about the Placemark element, see the [Google KML Reference](https://developers.google.com/kml/documentation/kmlreference#placemark) page or the [OGC KML specification](http://www.opengeospatial.org/standards/kml/).

### See Also

{% for seealso in page.seealso %}
[{{seealso}}]({{site.base_url}}/functions/{{seealso}}.html)
{% endfor %}

### Examples

[kml_01.ncl](examples/kml_01.html)
