---
    layout: function
    title: kml_open_document
    short: Creates a new KML document.
    category: functions
    tags: feature
    seealso: [kml_close_document, kml_write, kml_make_kmz]
---

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

function kml_open_document (
  filename:string,
  name:string,
  res:logical
)

returnval [*]  :  string
</code></pre>

### Arguments
*filename*

The file name to output the KML document or KMZ archive.

*name*

Text string displayed in Google Earth (or other geobrowser) as the label for the KML document.

*res*

A variable containing an optional list of [KML resources]({{baseurl}}/resources), attached as attributes. Set to True if you want the attached attributes to be applied, and False if you either don't have any resources to set, or you don't want the resources applied.

### Return value

A string array containing a KML document and associated attributes.

### Description

For more information about the Document element, see the [Google KML Reference](https://developers.google.com/kml/documentation/kmlreference#document) page or the [OGC KML specification](http://www.opengeospatial.org/standards/kml/).

### See Also

{% for seealso in page.seealso %}
[{{seealso}}]({{baseurl}}/functions/{{seealso}}.html)
{% endfor %} 

### Examples

