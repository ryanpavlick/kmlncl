---
    layout: function
    title: kml_get_vp_cropbox
    short: Gets the page coordinates for cropping a plot.
    category: functions  
    tags: overlay
    seealso: [kml_crop_plot, kml_add_groundoverlay, kml_get_vp_latlonbox]
---

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

function kml_get_vp_cropbox (
  wks:graphic,
  plot:graphic
)

returnval [6]  :  string
</code></pre>

### Arguments
*wks*

A Workstation identifier. The identifier is one returned either from calling [gsn_open_wks](http://ncl.ucar.edu/Document/Graphics/Interfaces/gsn_open_wks.shtml) or calling create to create a Workstation object. The file format must be "ps" (Postscript).

*plot*

A plot identifier created using [gsn_csm_contour_map_ce](http://ncl.ucar.edu/Document/Graphics/Interfaces/gsn_csm_contour_map_ce.shtml).

### Return value

Returns a string array of length 6 containing the top, bottom, left, and right page coordinates of the map portion of a plot, the file name of the postscript file to be cropped, and the file name of the intended cropped png file.

### Description

### See Also

{% for seealso in page.seealso %}
[{{seealso}}]({{site.base_url}}functions/{{seealso}}.html)
{% endfor %}

### Examples


