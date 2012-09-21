---
    layout: function
    title: kml_close_stylemap
    short: Closes an open StyleMap element in a KML document.
    category: functions
    tags: style
    seealso: [ kml_open_stylemap, kml_open_style ]
---

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

function kml_close_stylemap (
  kml:string
)

returnval [*]  :  string
</code></pre>

### Arguments
*kml*

A string array containing a KML document and associated attributes created with the function [kml_open_document]({{site.url}}/functions/kml_open_document.html).

### Return value

Returns a string array containing a KML document with a ``</StyleMap>`` tag appended to the end.

### Description

For more information about the StyleMap element, see the [Google KML Reference](https://developers.google.com/kml/documentation/kmlreference#stylemap) page or the [OGC KML specification](http://www.opengeospatial.org/standards/kml/).

### See Also

{% for seealso in page.seealso %}
[{{seealso}}]({{site.url}}/functions/{{seealso}}.html)
{% endfor %}

### Examples


