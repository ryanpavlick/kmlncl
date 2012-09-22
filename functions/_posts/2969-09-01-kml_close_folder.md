---
    layout: function
    title: kml_close_folder
    short: Closes an open Folder element in a KML document.
    category: functions
    tags: feature
    seealso: kml_open_folder
---

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

function kml_close_folder (
  kml:string
)

returnval [*]  :  string
</code></pre>

### Arguments
*kml*

A string array containing a KML document and associated attributes created with the function [kml_open_document]({{site.base_url}}/functions/kml_open_document.html).

### Return value

Returns a string array containing a KML document with a ``</Folder>`` tag appended to the end.

### Description

Folder elements are used to arrange other Feature elements hierarchically and may contain Placemarks, NetworkLinks, Overlays, and other Folders. Once all desired Feature elements have been added, the Folder element must be closed with the function [kml_close_folder]({{site.base_url}}/functions/kml_close_folder.html). 

For more information about the Folder element, see the [Google KML Reference](https://developers.google.com/kml/documentation/kmlreference#folder) page or the [OGC KML specification](http://www.opengeospatial.org/standards/kml/).

### See Also

{% for seealso in page.seealso %}
[{{seealso}}]({{site.base_url}}/functions/{{seealso}}.html)
{% endfor %}

### Examples

