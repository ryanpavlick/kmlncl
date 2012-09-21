---
    layout: function
    title: kml_crop_plot
    short: Crops the map portion of a plot using Imagemagick.
    category: functions  
    tags: overlay
    seealso: [kml_add_groundoverlay, kml_get_vp_cropbox]
---

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

function kml_crop_plot ( 
  cropbox:string,
  res:logical
)

returnval  :  string
</code></pre>

### Arguments
*cropbox*

A string array containing the top, bottom, left, and right page coordinates of the map portion of a plot, the file name of the postscript file to be cropped, and the file name of the intended cropped png file. The *cropbox* variable can be generated automatically with the function [kml_get_vp_cropbox]({{site.base_url}}functions/kml_get_vp_cropbox).

*res*

Not currently used.

### Return value

Returns a string containing the file name of the cropped png.

### Description

The function [kml_crop_plot]({{site.base_url}}functions/kml_crop_plot) uses the built-in NCL function **system** to call the Imagemagick function **convert**. 

### See Also

{% for seealso in page.seealso %}
[{{seealso}}]({{site.base_url}}functions/{{seealso}}.html)
{% endfor %}

### Examples


