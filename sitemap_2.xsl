<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
  version="1.0"
  xmlns:sm="http://www.sitemaps.org/schemas/sitemap/0.9"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:mobile="http://www.google.com/schemas/sitemap-mobile/1.0"
  xmlns:image="http://www.google.com/schemas/sitemap-image/1.1"
  xmlns:video="http://www.google.com/schemas/sitemap-video/1.1"
  xmlns:news="http://www.google.com/schemas/sitemap-news/0.9"
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns="http://www.w3.org/1999/xhtml">
 
  <xsl:output method="html" indent="yes" encoding="UTF-8"/>

  <xsl:template match="/">
<html>
<head>
<title>
<xsl:if test="sm:urlset/sm:url/mobile:mobile">Mobile </xsl:if>
<xsl:if test="sm:urlset/sm:url/image:image">Images </xsl:if>
<xsl:if test="sm:urlset/sm:url/news:news">News </xsl:if>
<xsl:if test="sm:urlset/sm:url/video:video">Video </xsl:if>
XML Sitemap
<xsl:if test="sm:sitemapindex"> Index</xsl:if>
</title>
<style type="text/css">
body {
	background-color: #DDD;
	font: normal 80%  "Trebuchet MS", "Helvetica", sans-serif;
	margin:0;
	width:100%;
	text-align:center;
}
#cont{
	margin:auto;
	width:100%;
	text-align:left;
}
a:link {
	color: #0180AF;
	text-decoration: underline;
}
a:hover {
	color: #666;
}
h1 {
	background-color:#fff;
	padding:20px;
	color:#00AEEF;
	text-align:left;
	font-size:32px;
	margin:0px;
}
h3 {
	font-size:12px;
	background-color:#B8DCE9;
	margin:0px;
	padding:10px;
}
h3 a {
	float:right;
	font-weight:normal;
	display:block;
}
table{
    width:100%;
    text-align:center;
    font-weight:none;
}
th {
	text-align:center;
	background-color:#00AEEF;
	color:#fff;
	padding:4px;
	font-weight:bold;
	font-size:12px;
}
tr {background: #fff}
tr:nth-child(odd) {background: #f0f0f0}
td{
	font-size:12px;
	padding:2px;
	text-align:left;
	width:30px;
	min-width:5px;
	max-width:475px;
	white-space:nowrap;
	overflow:hidden;
	padding-right:10px;
	text-overflow:ellipsis;
	border-bottom:1px solid #a9a9a9;
}
.url2 {
	text-align:right;
}
#footer {
	background-color:#B8DCE9;
	padding:10px;
}
</style>
</head>
<body><div id="cont">
<h1>
<xsl:if test="sm:urlset/sm:url/mobile:mobile">Mobile </xsl:if>
<xsl:if test="sm:urlset/sm:url/image:image">Images </xsl:if>
<xsl:if test="sm:urlset/sm:url/news:news">News </xsl:if>
<xsl:if test="sm:urlset/sm:url/video:video">Video </xsl:if>
XML Sitemap Generator<xsl:if test="sm:sitemapindex"> Index</xsl:if></h1>
<h3>
<xsl:choose>
<xsl:when  test="sm:sitemapindex"> 
Total sitemap files listed in this index: <xsl:value-of select="count(sm:sitemapindex/sm:sitemap)"/>
</xsl:when>
<xsl:otherwise> 
Total URLs in This Sitemap : <xsl:value-of select="count(sm:urlset/sm:url)"/>
</xsl:otherwise>
</xsl:choose>
</h3>

<xsl:apply-templates />

<div id="footer">
Created By <a href="https://shakib.eu.org" target="_blank"><b><u>Shakib Ahmed</u></b></a> | Powered By <b><i>Standalone Sitemap Generator</i></b>,
Copyright © 2021 - 2024 | Read More @ <a href="https://www.xml-sitemaps.com/standalone-google-sitemap-generator.html">XML Sitemaps</a>
</div>
</div>

</body>
</html>
  </xsl:template>
 
 
  <xsl:template match="sm:sitemapindex">
<table cellpadding="0" cellspacing="0" width="100%" style="text-align:center;" align="center">
<tr style="text-align:center;" align="center">
<th style="width:5px;">Id</th>
<th style="width:150px;">URL</th>
<th style="width:50px;">Last Updated Date</th>
</tr>
<xsl:for-each select="sm:sitemap">
<tr style="text-align:center;" align="center"> 
<xsl:variable name="loc"><xsl:value-of select="sm:loc"/></xsl:variable>
<xsl:variable name="pno"><xsl:value-of select="position()"/></xsl:variable>
<td style="width:5px;text-align:center;"><xsl:value-of select="$pno"/></td>
<td style="width:150px;"><a href="{$loc}"><xsl:value-of select="sm:loc"/></a></td>
<xsl:apply-templates/> 
</tr>
</xsl:for-each>
</table>
  </xsl:template>
 
  <xsl:template match="sm:urlset">
<table cellpadding="0" cellspacing="0" width="100%" style="text-align:center;" align="center">
<tr style="text-align:center;" align="center">
<th style="width:5px;">Id</th>
<th>URL</th>
<xsl:if test="sm:url/sm:lastmod"><th>Last Updated Date</th></xsl:if>
<xsl:if test="sm:url/sm:changefreq"><th>Frequency</th></xsl:if>
<xsl:if test="sm:url/sm:priority"><th>Priority</th></xsl:if>
</tr>
<xsl:for-each select="sm:url">
<tr style="text-align:center;" align="center"> 
<xsl:variable name="loc"><xsl:value-of select="sm:loc"/></xsl:variable>
<xsl:variable name="pno"><xsl:value-of select="position()"/></xsl:variable>
<td><xsl:value-of select="$pno"/></td>
<td><a href="{$loc}"><xsl:value-of select="sm:loc"/></a></td>
<xsl:apply-templates select="sm:*"/> 
</tr>
<xsl:apply-templates select="image:*"/> 
<xsl:apply-templates select="video:*"/> 
</xsl:for-each>
</table>
  </xsl:template>

<xsl:template match="sm:loc|image:loc|image:caption|video:*">
</xsl:template>

<xsl:template match="sm:lastmod|sm:changefreq|sm:priority">
<td>
	<xsl:apply-templates/>
</td>
</xsl:template>

  <xsl:template match="image:image">
<tr style="text-align:center;" align="center"> 
<xsl:variable name="loc"><xsl:value-of select="image:loc"/></xsl:variable>
<td></td>
<td class="url2"><a href="{$loc}"><xsl:value-of select="image:loc"/></a></td>
<td colspan="5"><div style="width:400px"><xsl:value-of select="image:caption"/></div></td>
<xsl:apply-templates/> 
</tr>
  </xsl:template>
  <xsl:template match="video:video">
<tr style="text-align:center;" align="center"> 
<xsl:variable name="loc"><xsl:choose><xsl:when test="video:player_loc != ''"><xsl:value-of select="video:player_loc"/></xsl:when><xsl:otherwise><xsl:value-of select="video:content_loc"/></xsl:otherwise></xsl:choose></xsl:variable>
<xsl:variable name="thumb"><xsl:value-of select="video:thumbnail_loc"/></xsl:variable>
<td></td>
<td class="url2"><a href="{$loc}"><xsl:choose><xsl:when test="video:player_loc != ''"><xsl:value-of select="video:player_loc"/></xsl:when><xsl:otherwise><xsl:value-of select="video:content_loc"/></xsl:otherwise></xsl:choose></a></td>
<td colspan="5"><div style="width:400px"><xsl:value-of select="video:title"/></div>
<xsl:if test="video:thumbnail_loc != ''"><img src="{$thumb}" alt="" /></xsl:if></td>
<xsl:apply-templates/> 
</tr>
  </xsl:template>

</xsl:stylesheet>
