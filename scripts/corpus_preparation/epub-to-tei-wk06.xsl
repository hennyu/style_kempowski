<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- script to transform epub HTML into TEI -->
    <!-- used for: Herzlich willkommen (wk06) -->
    <!-- &ndash; ersetzen durch – -->
    <xsl:template match="/">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title type="main">Herzlich willkommen</title>
                        <title type="short">Willkommen</title>
                        <title type="idno">
                            <idno type="viaf">...</idno>
                        </title>
                        <author>
                            <name type="full">Kempowski, Walter</name>
                            <name type="short">Kempowski</name>
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
                        <idno type="dhro">wk06</idno>
                    </publicationStmt>
                    <sourceDesc>
                        <bibl type="digital-source"> <!-- to do --> </bibl>
                        <bibl type="print-source"> <!-- to do --> </bibl>
                        <bibl type="edition-first"> <!-- to do --> </bibl>
                    </sourceDesc>
                </fileDesc>
                <encodingDesc>
                    <p><!--The following phenomena were marked up: part and chapter divisions, headings,
                        paragraphs, and emphases in italics.--></p>
                </encodingDesc>
                <revisionDesc>
                    <change when="2022-05-06" who="#uhk">Initial TEI version.</change>
                </revisionDesc>
            </teiHeader>
            <text>
                <body>
                    <xsl:apply-templates select=".//div[@class='einfacher-textrahmen'][h2[@class='kapitelziffer'] or h1[@class='teiletitel'] or p[@class='widmung']]"/>
                </body>
            </text>
        </TEI>
    </xsl:template>
    
    <xsl:template match="div[@class='einfacher-textrahmen'][h1[@class='teiletitel'] or p[@class='widmung']]">
        <div type="part">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="div[@class='einfacher-textrahmen'][h2[@class='kapitelziffer']]">
        <div type="chapter">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    
    <xsl:template match="h2[@class='kapitelziffer'] | h1[@class='teiletitel']">
        <head>
            <xsl:apply-templates/>
        </head>
    </xsl:template>
    
    
    <xsl:template match="p[starts-with(@class,'_0') or @class='widmung']">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    
    <xsl:template match="p[@class=('text_mit-einzug-komplett','text_mit-einzug-komplett_lz','einzug','texteinzug','tex_mieinzuglz','text','text_mit_einzug-erste-zeile','text_mit-einzug-16mm')]">
        <p rend="block">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="p[@class='fussnote']"/>
    
    <xsl:template match="span[@class='kursiv1']">
        <emph rend="italics">
            <xsl:apply-templates/>
        </emph>
    </xsl:template>
    
</xsl:stylesheet>