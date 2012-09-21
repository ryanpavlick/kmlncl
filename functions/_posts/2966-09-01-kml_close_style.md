---
    layout: function
    title: kml_close_style
    short: Closes an open Style element in a KML document.
    category: functions
    tags: style
    seealso: [ kml_open_style ]
---

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

function kml_close_style (
  kml:string
)

returnval [*]  :  string
</code></pre>

### Arguments
*kml*

A string array containing a KML document and associated attributes created with the function [kml_open_document](functions/kml_open_document.html).

### Return value

Returns a string array containing a KML document with a ``</Style>`` tag appended to the end.

### Description

For more information about the Style element, see the [Google KML Reference](https://developers.google.com/kml/documentation/kmlreference#style) page or the [OGC KML specification](http://www.opengeospatial.org/standards/kml/).

### See Also

{% for seealso in page.seealso %}
[{{seealso}}](functions/{{seealso}}.html)
{% endfor %}

### Examples


