<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs" xmlns="http://www.tei-c.org/ns/1.0"
    version="2.0">
    
    <!-- integrate POS annotation into TEI files (for SpaCy) -->
    
    <!--  
    How to call the script:
    java -jar /home/ulrike/Programme/saxon/saxon9he.jar -s:/home/ulrike/Dokumente/Rostock/Lehre/SS_22/Kempowski/Korpus/tei/wk01_ids.xml -xsl:/home/ulrike/Dokumente/Rostock/Lehre/SS_22/Kempowski/Korpus/annotate-tei-3.xsl -o:/home/ulrike/Dokumente/Rostock/Lehre/SS_22/Kempowski/Korpus/tei_ann/wk01_ann.xml
    -->
    
    <xsl:output indent="yes" method="xml" encoding="UTF-8"/>
    
    <!-- copy all -->
    <xsl:template match="node() | @* | comment() | processing-instruction()">
        <xsl:copy>
            <xsl:apply-templates select="node() | @* | comment() | processing-instruction()"/>
        </xsl:copy>
    </xsl:template>
    
    
    <!-- annotate on paragraph level -->
    <xsl:template match="p[ancestor::body] | ab[ancestor::body] | l[ancestor::body]">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            
            <!-- read SpaCy output -->
            <xsl:variable name="id" select="@xml:id"/>
            <xsl:variable name="outfile" select="concat('ann_out_sp/', $id,'.sp')"/>
            <xsl:variable name="tagging" select="unparsed-text($outfile,'UTF-8')"/>
            <xsl:analyze-string select="$tagging" regex="^([^\t]+)\t([^\t]+)\t([^\t\n]+)\t([^\t\n]+)\t([^\t\n]+)?$" flags="m">
                <xsl:matching-substring>
                    <w pos="{concat(regex-group(3),'_',regex-group(4))}" lemma="{regex-group(2)}">
                        <xsl:if test="regex-group(5)!=''">
                            <xsl:attribute name="msd" select="regex-group(5)"/>
                        </xsl:if>
                        <xsl:value-of select="regex-group(1)"/>
                    </w>
                </xsl:matching-substring>
            </xsl:analyze-string>
        </xsl:copy>
    </xsl:template>
    
    
    
    
    
</xsl:stylesheet>