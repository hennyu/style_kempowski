<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- script to transform epub HTML into TEI -->
    <!-- used for: Gruppenbild mit Dame (hb02) -->
    <!-- &ndash; ersetzen durch –
    &mdash; durch — 
    &shy; durch - -->
    
    <xsl:output indent="yes"/>
    
    <xsl:template match="/">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title type="main">Gruppenbild mit Dame</title>
                        <title type="short">Dame</title>
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
                        <date when="2022">2022</date>
                        <idno type="dhro">hb02</idno>
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
                    <xsl:apply-templates select=".//div[@class='calibre5']"/>
                </body>
            </text>
        </TEI>
    </xsl:template>
    
    <xsl:template match="div[@class='calibre5']">
        <div type="chapter">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="h1 | h2">
        <head>
            <xsl:apply-templates/>
        </head>
    </xsl:template>
    
    <xsl:template match="p[@class=('calibre6','calibre9','calibre13','calibre14')][normalize-space(.)!=''][not(parent::div[@class='poem'])]">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="div[@class='navbar']|span[contains(@class,'pagestart')]"/>
    
    <xsl:template match="div[@class=('poem')]">
        <lg>
            <xsl:apply-templates/>
        </lg>
    </xsl:template>
    
    <xsl:template match="div[@class='poem']/p[@class='calibre9' or @class='calibre10'][normalize-space(.)!='']">
       <l><xsl:apply-templates/></l>
    </xsl:template>
    
    <xsl:template match="p[@class='intermediate-heading']">
        <p rend="block">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
   
   <xsl:template match="i[@class='calibre8']">
       <emph rend="italics">
           <xsl:apply-templates/>
       </emph>
   </xsl:template>
    
    
    
</xsl:stylesheet>