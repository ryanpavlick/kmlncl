---
    layout: function
    title: kml_open_folder
    short: Adds an open Folder element to a KML document.
    category: functions  
    tags: feature
    seealso: kml_close_folder
---

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

function kml_open_folder (
  kml:string,
  name:string,
  res:logical
)

returnval [*]  :  string
</code></pre>

### Arguments
*kml*

A string array containing a KML document created with the function [kml_open_document]({{site.url}}/functions/kml_open_document.html).

*name*

Text string displayed in Google Earth (or other geobrowser) as the label for the Folder.

*res*

A variable containing an optional list of [KML resources]({{site.url}}/resources), attached as attributes. Set to True if you want the attached attributes to be applied, and False if you either don't have any resources to set, or you don't want the resources applied.

### Return value

A string array containing a KML document with an open Folder element appended to the end.

### Description

Folder elements are used to arrange other Feature elements hierarchically and may contain Placemarks, NetworkLinks, Overlays, and other Folders. Once all desired Feature elements have been added, the Folder element must be closed with the function [kml_close_folder]({{site.url}}/functions/kml_close_folder.html). 

For more information about the Folder element, see the [Google KML Reference](https://developers.google.com/kml/documentation/kmlreference#folder) page or the [OGC KML specification](http://www.opengeospatial.org/standards/kml/).

### See Also

{% for seealso in page.seealso %}
[{{seealso}}]({{site.url}}/functions/{{seealso}}.html)
{% endfor %}

### Examples

