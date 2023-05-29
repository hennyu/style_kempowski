<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    version="2.0">
    
    <!-- 
        Extract annotated text which only keeps POS tags and punctuation marks (deleting all other word forms).
        Input file e.g. wk01_ann_ids_sents.xml, output file e.g. wk01-ANN.xml 
    -->
    
    <xsl:template match="node()|@*|processing-instruction()|comment()">
        <xsl:copy>
            <xsl:apply-templates select="node()|@*|processing-instruction()|comment()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="w">
        <xsl:copy>
            <xsl:copy-of select="@pos|@xml:id"/>
            <xsl:attribute name="lemma">
                <xsl:choose>
                    <xsl:when test="@pos='$.'"><xsl:value-of select="@lemma"/></xsl:when>
                    <xsl:otherwise>x</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
        </xsl:copy>
    </xsl:template>
    
    
</xsl:stylesheet>