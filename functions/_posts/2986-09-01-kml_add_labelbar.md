---
    layout: function
    title: kml_add_labelbar
    short: Adds a labelbar as a ScreenOverlay element to a KML document
    category: functions
    tags: overlay
---

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

function kml_add_labelbar (
  kml:string,
  name:string,
  wks:graphic,
  plot:graphic,
  res:logical
)

returnval [*]  :  string
</code></pre>

### Arguments
*kml*

A string array containing a KML document and associated attributes created with the function [kml_open_document]({{site.url}}/functions/kml_open_document.html).

*name*

short description of name

*wks*

short description of wks

*plot*

short description of plot

*res*

A variable containing an optional list of [KML resources]({{site.url}}/resources), attached as attributes. Set to True if you want the attached attributes to be applied, and False if you either don't have any resources to set, or you don't want the resources applied.

### Return value

### Description

For more information about the Camera element, see the [Google KML Reference](https://developers.google.com/kml/documentation/kmlreference#camera) page or the [OGC KML specification](http://www.opengeospatial.org/standards/kml/).


### See Also

{% for seealso in page.seealso %}
[{{seealso}}]({{site.url}}/functions/{{seealso}}.html)
{% endfor %}

### Examples


