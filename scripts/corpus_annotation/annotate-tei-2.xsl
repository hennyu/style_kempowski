<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!--  
    Create text files for all paragraphs, blocks, verse lines    
        
    How to call the script:
    java -jar /home/ulrike/Programme/saxon/saxon9he.jar /home/ulrike/Dokumente/Rostock/Lehre/SS_22/Kempowski/Korpus/tei/wk01_ids.xml /home/ulrike/Dokumente/Rostock/Lehre/SS_22/Kempowski/Korpus/annotate-tei-2.xsl
    -->
    
    <!-- create text files for all paragraphs, blocks, verse lines -->
    <xsl:template match="/">
        <xsl:for-each select="//p[ancestor::body] | //ab[ancestor::body] | //l[ancestor::body]">
            <xsl:result-document href="{concat('ann_in_v2/',@xml:id,'.txt')}" method="text" encoding="UTF-8">
                <xsl:value-of select="."/>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>