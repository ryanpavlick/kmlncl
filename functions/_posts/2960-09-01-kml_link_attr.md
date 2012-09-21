---
    layout: function
    title: kml_link_attr
    short: short description
    category: functions  
    tags: internal
    published: false
---

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

function kml_link_attr (
  kml:string,
  href:string,
  ires:logical
)

returnval [*]  :  string
</code></pre>

### Arguments
*kml*

A string array containing a KML document and associated attributes created with the function [kml_open_document]({{baseurl}}/functions/kml_open_document.html).

*href*

short description of href

*ires*

short description of ires

### Return value

### Description

For more information about the Link element, see the [Google KML Reference](https://developers.google.com/kml/documentation/kmlreference#link) page or the [OGC KML specification](http://www.opengeospatial.org/standards/kml/).

### See Also

{% for seealso in page.seealso %}
[{{seealso}}]({{baseurl}}/functions/{{seealso}}.html)
{% endfor %}

### Examples


