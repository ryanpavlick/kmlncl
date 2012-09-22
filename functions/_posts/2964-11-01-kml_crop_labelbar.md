---
    layout: function
    title: kml_crop_labelbar
    short: Crops the label bar from a plot using Imagemagick.
    category: functions  
    tags: overlay
    seealso: [kml_add_screenoverlay]
---

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

function kml_crop_labelbar ( 
    wks:graphic,
    plot:graphic
)

returnval  :  string
</code></pre>

### Arguments
*wks*

A Workstation identifier. The identifier is one returned either from calling [gsn_open_wks](http://ncl.ucar.edu/Document/Graphics/Interfaces/gsn_open_wks.shtml) or calling create to create a Workstation object. The file format must be "ps" (Postscript).

*plot*

A plot identifier created using [gsn_csm_contour_map_ce](http://ncl.ucar.edu/Document/Graphics/Interfaces/gsn_csm_contour_map_ce.shtml).

### Return value

Returns a string containing the file name of the cropped png.

### Description

The function [kml_crop_labelbar]({{site.base_url}}/functions/kml_crop_plot) uses the built-in NCL function **system** to call the Imagemagick function **convert**.  

### See Also

{% for seealso in page.seealso %}
[{{seealso}}]({{site.base_url}}/functions/{{seealso}}.html)
{% endfor %}

### Examples


