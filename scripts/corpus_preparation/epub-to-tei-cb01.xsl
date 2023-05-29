<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- script to transform epub HTML into TEI -->
    <!-- used for: Ein Frühling im Tessin (cb01) -->
    <!-- &ndash; ersetzen durch –
    &mdash; durch — 
    &shy; durch - -->
    
    <xsl:output indent="yes"/>
    
    <xsl:template match="/">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title type="main">Ein Frühling im Tessin</title>
                        <title type="short">Tessin</title>
                        <title type="idno">
                            <idno type="viaf">...</idno>
                        </title>
                        <author>
                            <name type="full">Brückner, Christine</name>
                            <name type="short">BrücknerC</name>
                            <idno type="viaf">...</idno>
                        </author>
                        <principal xml:id="uhk">Ulrike Henny-Krahmer</principal>
                    </titleStmt>
                    <extent>
                        <measure unit="words">-</measure>
                    </extent>
                    <publicationStmt>
                        <publisher>-</publisher>
                        <availability status="restricted">
                            <p>This work is protected by copyright. For research use only.</p>
                        </availability>
                        <date when="2022">2022</date>
                        <idno type="dhro">cb01</idno>
                    </publicationStmt>
                    <sourceDesc>
                        <bibl type="digital-source">...</bibl>
                        <bibl type="print-source">...</bibl>
                        <bibl type="edition-first">...</bibl>
                    </sourceDesc>
                </fileDesc>
                <encodingDesc>
                    <p/>
                </encodingDesc>
                <profileDesc>
                    <abstract>
                        <p>...</p>
                    </abstract>
                </profileDesc>
                <revisionDesc>
                    <change when="2022-06-23" who="#uhk">Initial TEI version.</change>
                </revisionDesc>
            </teiHeader>
            <text>
                <body>
                    <xsl:apply-templates select=".//div[@class='level']"/>
                </body>
            </text>
        </TEI>
    </xsl:template>
    
    <xsl:template match="div[@class='level']">
        <div type="chapter">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="h1 | h2">
        <head>
            <xsl:apply-templates/>
        </head>
    </xsl:template>
    
    <xsl:template match="p[@class=('paraoe','calibre2','parazitat','paracenter')][normalize-space(.)!='']">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <!--<xsl:template match="p[@class=('gedicht')]">
        <l>
            <xsl:apply-templates/>
        </l>
    </xsl:template>
    
    <xsl:template match="br[@class='calibre3']">
        <lb/>
    </xsl:template>
    
    
    
    <xsl:template match="p[@class=('einzugl')][normalize-space(.)!='']">
        <p rend="block">
            <xsl:apply-templates/>
        </p>
    </xsl:template>-->
    
    
    <xsl:template match="i[@class='calibre3']">
        <emph rend="italics">
            <xsl:apply-templates/>
        </emph>
    </xsl:template>
    
    
    
</xsl:stylesheet>