---
    layout: function
    title: kml_close_document
    short: Closes an existing KML document
    category: functions
    tags: feature
    seealso: [ kml_open_document, kml_write ]
---

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

function kml_close_doc (
  kml:string
)

returnval [*]  :  string
</code></pre>

### Arguments
*kml*

A string array containing a KML document and associated attributes created with the function [kml_open_document]({{site.base_url}}functions/kml_open_document).

### Return value

Returns a string array containing a KML document with a ``</Document>`` tag appended to the end.

### Description

For more information about the Document element, see the [Google KML Reference](https://developers.google.com/kml/documentation/kmlreference#document) page or the [OGC KML specification](http://www.opengeospatial.org/standards/kml/).

### See Also

{% for seealso in page.seealso %}
[{{seealso}}]({{site.base_url}}functions/{{seealso}}.html)
{% endfor %}

### Examples

