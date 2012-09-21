---
    layout: function
    title: kml_feature_attr
    short: short description
    category: functions  
    tags: internal
    published: false
---

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

function kml_feature_attr (
  kml:string,
  name:string,
  ires:logical
)

returnval [*]  :  string
</code></pre>

### Arguments
*kml*

A string array containing a KML document and associated attributes created with the function [kml_open_document]({{baseurl}}/functions/kml_open_document.html).

*name*

short description of name

*ires*

short description of ires

### Return value

### Description

### See Also

{% for seealso in page.seealso %}
[{{seealso}}]({{baseurl}}/functions/{{seealso}}.html)
{% endfor %}

### Examples


