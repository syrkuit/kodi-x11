<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" encoding="UTF-8" omit-xml-declaration="no"/> 

<xsl:template match="@*|node()">
    <xsl:copy>
        <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
</xsl:template>

<xsl:template match="/settings/section/category/group/setting[@id='audiooutput.guisoundmode']/default">
    <default>1</default>
</xsl:template>
<xsl:template match="/settings/section/category/group/setting[@id='services.webserver']/default">
    <default>true</default>
</xsl:template>
<xsl:template match="/settings/section/category/group/setting[@id='services.webserverauthentication']/default">
    <default>false</default>
</xsl:template>

</xsl:stylesheet>
