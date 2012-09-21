---
    layout: function
    title: kml_make_kmz
    short: Generates a KMZ archive from a KML document and any associated overlays, images, icons, or COLLADA 3D models
    category: functions  
    tags: general
    seealso: [kml_write, kml_open_document]
---

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

procedure kml_make_kmz (
  kml:string
)

returnval
</code></pre>

### Arguments
*kml*

A string array containing a KML document and associated attributes created with the function [kml_open_document](functions/kml_open_document.html).

### Description

The [kml_make_kmz](#kml_make_kmz) function generates a KMZ archive file containing a KML document and any associated overlays, images, icons, or COLLADA 3D models. It uses the built-in NCL function [system](http://ncl.ucar.edu/Document/Functions/Built-in/system.shtml) to call the Unix command `zip`.

More information about [KMZ archives](https://developers.google.com/kml/documentation/kmzarchives) is available in the [Google KML Documentation](https://developers.google.com/kml/).

### See Also

{% for seealso in page.seealso %}
[{{seealso}}](functions/{{seealso}}.html)
{% endfor %}

### Examples

