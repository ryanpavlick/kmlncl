---
    layout: function
    title: kml_add_kmzfile
    short: Associates the name of a file to be included in a KMZ archive with a KML document.
    category: functions  
    tags: general
    seealso: [kml_add_groundoverlay, kml_add_model, kml_add_screenoverlay, kml_make_kmz]
---

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

procedure kml_add_kmzfile (
  kml:string,
  filename: string
)

returnval
</code></pre>

### Arguments
*kml*

A string array containing a KML document and associated attributes created with the function [kml_open_document](functions/kml_open_document.html).

### Description

The [kml_add_file](#kml_add_file) function adds a file name to the *kml@files* attribute of KML document. The list of files in *kml@files* (e.g. overlays, images, icons, or COLLADA 3D models) is used by function [kml_make_kmz](#kml_make_kmz) to generates a KMZ archive file.

More information about [KMZ archives](https://developers.google.com/kml/documentation/kmzarchives) is available in the [Google KML Documentation](https://developers.google.com/kml/).

### See Also

{% for seealso in page.seealso %}
[{{seealso}}](functions/{{seealso}}.html)
{% endfor %}

### Examples

