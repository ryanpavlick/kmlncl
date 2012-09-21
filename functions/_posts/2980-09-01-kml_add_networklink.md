---
    layout: function
    title: kml_add_networklink
    short: Adds a NetworkLink element for referencing a KML/KMZ file on a local or remote network.
    category: functions  
    tags: feature
    seealso: 
---

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

function kml_add_networklink (
  kml:string,
  name:string,
  link:string,
  res:logical
)

returnval [*]  :  string
</code></pre>

### Arguments
*kml*

A string array containing a KML document and associated attributes created with the function [kml_open_document]({{site.base_url}}functions/kml_open_document.html).

*name*

Text string displayed in Google Earth (or other geobrowser) as the label for the NetworkLink.

*link*

A string containing a URL (either an HTTP address or a local file specification) to a KML file or KMZ archive.  Relative URLs can be used in this tag and are evaluated relative to the enclosing KML file. 

*res*

A variable containing an optional list of [KML resources](resources), attached as attributes. Set to True if you want the attached attributes to be applied, and False if you either don't have any resources to set, or you don't want the resources applied.

### Return value

A string array containing a KML document with NetworkLink element appended to the end.

### Description

For more information about the NetworkLink element, see the [Google KML Reference](https://developers.google.com/kml/documentation/kmlreference#networklink) page or the [OGC KML specification](http://www.opengeospatial.org/standards/kml/).

### See Also

{% for seealso in page.seealso %}
[{{seealso}}]({{site.base_url}}functions/{{seealso}}.html)
{% endfor %}

### Examples


