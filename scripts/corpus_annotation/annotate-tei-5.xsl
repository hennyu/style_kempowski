<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" xmlns="http://www.tei-c.org/ns/1.0"
    version="2.0">
    
    <!--  
    Add sentence markup    
        
    How to call the script:
    java -jar /home/ulrike/Programme/saxon/saxon9he.jar -s:/home/ulrike/Dokumente/Rostock/Lehre/SS_22/Kempowski/Korpus/tei_ann/wk01_ann_ids.xml -xsl:/home/ulrike/Dokumente/Rostock/Lehre/SS_22/Kempowski/Korpus/annotate-tei-5.xsl -o:/home/ulrike/Dokumente/Rostock/Lehre/SS_22/Kempowski/Korpus/tei_ann/wk01_ann_ids_sents.xml
    -->
    
    <xsl:output indent="yes"/>
    
    <xsl:template match="node() | @* | comment() | processing-instruction()">
        <xsl:copy>
            <xsl:apply-templates select="node() | @* | comment() | processing-instruction()"/>
        </xsl:copy>
    </xsl:template>
    
    <!-- add sentence markup -->
    <xsl:template match="p[ancestor::body] | ab[ancestor::body] | l[ancestor::body]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:for-each-group select="w" group-ending-with="w[ends-with(@pos,'$.')]">
                <s>
                    <xsl:copy-of select="current-group()"/>
                </s>
            </xsl:for-each-group>
            </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>