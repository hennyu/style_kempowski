<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- script to transform epub HTML into TEI -->
    <!-- used for: Ansichten eines Clowns (hb01) -->
    <!-- &ndash; ersetzen durch –
    &mdash; durch — 
    &shy; durch - -->
    
    <xsl:output indent="yes"/>
    
    <xsl:template match="/">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title type="main">Ansichten eines Clowns</title>
                        <title type="short">Clown</title>
                        <title type="idno">
                            <idno type="viaf">...</idno>
                        </title>
                        <author>
                            <name type="full">Böll, Heinrich</name>
                            <name type="short">BöllH</name>
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
                        <date when="2023">2023</date>
                        <idno type="dhro">hb01</idno>
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
                    <change when="2023-05-20" who="#uhk">Initial TEI version.</change>
                </revisionDesc>
            </teiHeader>
            <text>
                <body>
                    <xsl:apply-templates select=".//div[@type='bodymatter chapter']"/>
                </body>
            </text>
        </TEI>
    </xsl:template>
    
    <xsl:template match="div[@type='bodymatter chapter']">
        <div type="chapter">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="div[@class='backlink']"/>
    
    <xsl:template match="h3">
        <head>
            <xsl:apply-templates/>
        </head>
    </xsl:template>
    
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="em">
        <emph rend="italics">
            <xsl:apply-templates/>
        </emph>
    </xsl:template>
    
    
    
    
    
    
</xsl:stylesheet>