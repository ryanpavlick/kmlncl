---
    layout: function
    title: kml_overlay_attr
    short: short description
    category: functions    
    tags: internal
    published: false
---

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

function kml_overlay_attr (
  kml:string,
  icon:string,
  res:logical
)

returnval [*]  :  string
</code></pre>

### Arguments
*kml*

A string array containing a KML document and associated attributes created with the function [kml_open_document]({{site.base_url}}/functions/kml_open_document.html).

*icon*

short description of icon

*res*

A variable containing an optional list of [KML resources](resources), attached as attributes. Set to True if you want the attached attributes to be applied, and False if you either don't have any resources to set, or you don't want the resources applied.

### Return value

### Description

### See Also

{% for seealso in page.seealso %}
[{{seealso}}]({{site.base_url}}/functions/{{seealso}}.html)
{% endfor %}

### Examples


