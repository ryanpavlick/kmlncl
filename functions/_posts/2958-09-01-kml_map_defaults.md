---
    layout: function
    title: kml_map_defaults
    short: Sets some gsn resources for plotting ground overlays.
    tags: overlay
    category: functions
---

### Prototype

<pre><code>load "/usr/local/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "/usr/local/lib/ncarg/nclscripts/kml/kml.ncl"

procedure kml_map_defaults (
  res:logical
)

returnval
</code></pre>

### Arguments
*res*

A variable containing an optional list of plot resources, attached as attributes. Set to True if you want the attached attributes to be applied, and False if you either don't have any resources to set, or you don't want the resources applied.

### Description

### See Also

{% for seealso in page.seealso %}
[{{seealso}}]({{site.base_url}}/functions/{{seealso}}.html)
{% endfor %}

### Examples


