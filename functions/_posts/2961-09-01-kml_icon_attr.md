---
    layout: function
    title: kml_icon_attr
    short: short description
    categories: [functions, write]  
    tags: internal
    published: false
---

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

function kml_icon_attr (
  kml:string,
  icon:string,
  ires:logical
)

returnval [*]  :  string
</code></pre>

### Arguments
*kml*

A string array containing a KML document and associated attributes created with the function [kml_open_document]({{site.base_url}}functions/kml_open_document.html).

*icon*

short description of icon

*ires*

short description of ires

### Return value

### Description

For more information about the Icon element, see the [Google KML Reference](https://developers.google.com/kml/documentation/kmlreference#icon) page or the [OGC KML specification](http://www.opengeospatial.org/standards/kml/).

### See Also

{% for seealso in page.seealso %}
[{{seealso}}]({{site.base_url}}functions/{{seealso}}.html)
{% endfor %}

### Examples


