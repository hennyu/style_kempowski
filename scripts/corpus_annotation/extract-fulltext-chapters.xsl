<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:map="http://www.w3.org/2005/xpath-functions/map"
    version="3.0">
    
    <!-- 
        create plain text from annotated TEI of "Ein Kapitel für sich" (of individual chapters)
        create plain text with words permuted randomly in segments of a specific length (e.g. 1000)
    -->
    
    <!--  
    How to call the script:
    java -jar /home/ulrike/Programme/saxon/saxon9he.jar -s:/home/ulrike/Dokumente/Rostock/Lehre/SS_22/Kempowski/Korpus/tei_ann/wk01_ann_ids_sents.xml -xsl:/home/ulrike/Dokumente/Rostock/Lehre/SS_22/Kempowski/Korpus/extract-fulltext-kapitel.xsl
    -->
    
    <xsl:variable name="input-filename">wk01</xsl:variable>
    <xsl:variable name="seg-length">1000</xsl:variable>
    
    <xsl:output method="text" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <!--<xsl:call-template name="fulltext"/>-->
        <xsl:call-template name="fulltext-random"/>
    </xsl:template>
    
    <xsl:template name="fulltext">
        <!-- Fremdstatements (am Anfang der Teile), Kapiteltypen: DIE MUTTER, WALTER, ROBERT, EIN BRIEF -->
        <xsl:for-each select=".//div[@type='chapter']">
            <xsl:variable name="chapter-num" select="head[1]"/>
            <xsl:variable name="chapter-title" select="head[2]"/>
            <xsl:variable name="chapter-type">
                <xsl:choose>
                    <xsl:when test="$chapter-title='DIE MUTTER'">mutter</xsl:when>
                    <xsl:when test="$chapter-title='WALTER'">walter</xsl:when>
                    <xsl:when test="$chapter-title='ROBERT'">robert</xsl:when>
                    <xsl:when test="$chapter-title='EIN BRIEF'">brief</xsl:when>
                </xsl:choose>
            </xsl:variable>
            <xsl:result-document href="{concat('txt_kapitel/',$chapter-type,'_',$chapter-num,'.txt')}" method="text">
                <xsl:for-each select=".//w">
                    <xsl:value-of select="."/><xsl:text>
</xsl:text>
                </xsl:for-each>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:variable name="vngen" 
        as="map(xs:string, item())" 
        select="random-number-generator()"/>
    
    
    <xsl:template name="fulltext-random">
        <!-- Fremdstatements (am Anfang der Teile), Kapiteltypen: DIE MUTTER, WALTER, ROBERT, EIN BRIEF -->
        <xsl:for-each select=".//div[@type='chapter']">
            <xsl:variable name="chapter-num" select="head[1]"/>
            <xsl:variable name="chapter-title" select="head[2]"/>
            <xsl:variable name="chapter-type">
                <xsl:choose>
                    <xsl:when test="$chapter-title='DIE MUTTER'">mutter</xsl:when>
                    <xsl:when test="$chapter-title='WALTER'">walter</xsl:when>
                    <xsl:when test="$chapter-title='ROBERT'">robert</xsl:when>
                    <xsl:when test="$chapter-title='EIN BRIEF'">brief</xsl:when>
                </xsl:choose>
            </xsl:variable>
            <xsl:result-document href="{concat('txt_kapitel_random_', $seg-length, '/', $chapter-type, '_', $chapter-num, '.txt')}" method="text">
                <xsl:for-each-group select=".//w" group-adjacent="ceiling(position() div $seg-length)">
                    <xsl:variable name="group" select="current-group()"/>
                    <xsl:variable name="group-length" select="count($group)"/>
                    <xsl:for-each select="map:get($vngen, 'permute')(1 to $group-length)">
                        <xsl:variable name="pos" select="."/>
                        <xsl:value-of select="$group[$pos]"/><xsl:text>
</xsl:text>
                    </xsl:for-each>
                </xsl:for-each-group>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    
</xsl:stylesheet>