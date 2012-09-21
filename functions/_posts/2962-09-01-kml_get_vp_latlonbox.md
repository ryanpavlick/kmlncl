---
    layout: function
    title: kml_get_vp_latlonbox
    short: Gets the spatial coordinates defining the bounding box of a plot.
    category: functions  
    tags: overlay
    seealso: [kml_add_groundoverlay, kml_get_vp_cropbox]
---

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

function kml_get_vp_latlonbox (
  plot:graphic
)

returnval [4]  :  float
</code></pre>

### Arguments
*plot*

short description of plot

### Return value

### Description

### See Also

{% for seealso in page.seealso %}
[{{seealso}}]({{site.base_url}}functions/{{seealso}}.html)
{% endfor %}

### Examples


