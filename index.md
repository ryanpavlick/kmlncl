---
layout: default
---

<table class="center"> 
  <tr>
<td width="33%"><a href="https://developers.google.com/kml" id="fat">KML</a> is an OGC-standard file format used to display geographic data in geobrowsers like Google Earth&trade; and Google Maps&trade;.</td>

<td width="33%"><a href="https://www.ncl.ucar.edu" id="fat">NCL</a> is an open-source scripting language specifically designed for scientific data processing and visualization.</td>  

<td width="33%"><a href="{{site.base_url}}/index.html#installing_kml" id="fat">kmlncl</a> is an NCL library which makes it easy to produce engaging KML visualizations.</td>
</tr>
</table>

<div id='coin-slider'>
	<a href="{{site.base_url}}/examples/#ex_02" target="_blank">
		<img src='{{site.base_url}}/img/slide-1.png'>
		<span>
			Example 02: Polygon, PolyStyle
		</span>
	</a>
	<a href="{{site.base_url}}/examples/#ex_03">
		<img src='{{site.base_url}}/img/slide-2.png'>
		<span>
			Example 03: NetworkLink, BalloonStyle
		</span>
	</a>
	<a href="{{site.base_url}}/examples/#ex_04">
		<img src='{{site.base_url}}/img/slide-3.png'>
		<span>
			Example 04: 3D COLLADA Models, Camera
		</span>
	</a>
  <!-- <a href="{{site.base_url}}/examples/#ex_05">
    <img src='{{site.base_url}}/img/slide-4.png'>
    <span>
      Example 05: GroundOverlay, ScreenOverlay
    </span>
  </a> -->
	<a href="{{site.base_url}}/examples/#ex_06">
  		<img src='{{site.base_url}}/img/slide-5.png'>
  		<span>
  			Example 06: GroundOverlay, ScreenOverlay, LookAt
  		</span>
	</a>
  <a href="{{site.base_url}}/examples/#ex_07">
      <img src='{{site.base_url}}/img/animated_kml.gif'>
      <span>
        Example 07: Animation, Folder
      </span>
  </a>
  <a href="{{site.base_url}}/examples/#ex_8">
      <img src='{{site.base_url}}/img/slide-8.png'>
      <span>
        Example 08: get_isolines, LineString
      </span>
  </a>
</div>

### Installing kmlncl

Download the [kmlncl.tar.gz](https://github.com/rpavlick/kmlncl/tarball/master) tarball.

Untar it and copy the `kml` subdirectory to your `nclscripts` directory:

    % tar -xvzf kmlncl.tar.gz
    % cd kmlncl
    % cp -r kml $NCARG_ROOT/lib/ncarg/nclscripts
    
The kmlncl library **requires** NCL version 6.10-beta or later. Some functions require <a href="http://www.imagemagick.org">ImageMagick</a>. We also recommend installing the latest version of [Google Earth](http://www.google.com/earth).

### Feedback

Please post any **kmlncl**-related bug reports or feature requests on the kmlncl [issues](http://github.com/rpavlick/kmlncl/issues) page on GitHub. 

For general questions about NCL, please refer to the [NCL website](http://www.ncl.ucar.edu) or the [ncl-talk e-mail list](http://ncl.ucar.edu/Support/email_lists.shtml). 

For general questions about KML, please refer to the [Google KML documention](http://developers.google.com/kml) or [Stackoverflow](http://stackoverflow.com/questions/tagged/kml).

### License

Copyright &copy; 2010-2013, [Ryan Pavlick](http://github.com/rpavlick) and contributors. See the [`CONTRIBUTORS.md`](https://github.com/rpavlick/kmlncl/blob/master/CONTRIBUTORS.md) file for a full list of copyright holders.

kmlncl is free software licensed under the BSD 2-clause license. See the [`LICENSE.md`](https://github.com/rpavlick/kmlncl/blob/master/LICENSE.md) file for the full terms of this license. Unless otherwise specified, any contributions will be assumed to be licensed under the same terms.

<script type="text/javascript">
	$(document).ready(function() {
		$('#coin-slider').coinslider({ width: 660, height:400, delay: 5000, effect: 'rain' });
    ;
	});
</script>
