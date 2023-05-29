<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!--  
    Create ids for words
    
    How to call the script:
    java -jar /home/ulrike/Programme/saxon/saxon9he.jar -s:/home/ulrike/Dokumente/Rostock/Lehre/SS_22/Kempowski/Korpus/tei_ann/wk01_ann.xml -xsl:/home/ulrike/Dokumente/Rostock/Lehre/SS_22/Kempowski/Korpus/annotate-tei-4.xsl -o:/home/ulrike/Dokumente/Rostock/Lehre/SS_22/Kempowski/Korpus/tei_ann/wk01_ann_ids.xml
    -->
    
    <xsl:template match="node() | @* | comment() | processing-instruction()">
        <xsl:copy>
            <xsl:apply-templates select="node() | @* | comment() | processing-instruction()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- create ids for words -->
    <xsl:template match="w[ancestor::body]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:variable name="parent-id" select="parent::*/@xml:id"/>
            <xsl:variable name="position" select="count(preceding-sibling::w) + 1"/>
            <xsl:attribute name="xml:id" select="concat($parent-id, '_', $position)"/>
            <xsl:apply-templates/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>