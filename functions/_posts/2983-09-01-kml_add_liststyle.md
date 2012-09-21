---
    layout: function
    title: kml_add_liststyle
    short: Adds a ListStyle element to a KML document.
    category: functions
    tags: style
    seealso: [ kml_open_style, kml_close_style ]
---

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

function kml_add_liststyle (
  kml:string,
  href:string,
  res:logical
)

returnval [*]  :  string
</code></pre>

### Arguments
*kml*

A string array containing a KML document and associated attributes created with the function [kml_open_document]({{site.base_url}}functions/kml_open_document.html).

*href*

Specifies the URL of the image used in the List View for the Feature.

*res*

A variable containing an optional list of [KML resources](resources), attached as attributes. Set to True if you want the attached attributes to be applied, and False if you either don't have any resources to set, or you don't want the resources applied.

### Return value

A string array containing a KML document with a ListStyle element appended to the end.

### Description

For more information about the ListStyle element, see the [Google KML Reference](https://developers.google.com/kml/documentation/kmlreference#liststyle) page or the [OGC KML specification](http://www.opengeospatial.org/standards/kml/).

### See Also

{% for seealso in page.seealso %}
[{{seealso}}]({{site.base_url}}functions/{{seealso}}.html)
{% endfor %}

### Examples


