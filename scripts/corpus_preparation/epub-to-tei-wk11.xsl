<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- script to transform epub HTML into TEI -->
    <!-- used for: Alles umsonst (wk11) -->
    <!-- &ndash; ersetzen durch –
    &mdash; durch — -->
    
    <xsl:output indent="yes"/>
    
    <xsl:template match="/">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title type="main">Alles umsonst</title>
                        <title type="short">AllesUmsonst</title>
                        <title type="idno">
                            <idno type="viaf">...</idno>
                        </title>
                        <author>
                            <name type="full">Kempowski, Walter</name>
                            <name type="short">KempowskiW</name>
                            <idno type="viaf">49227399</idno>
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
                        <idno type="dhro">wk11</idno>
                    </publicationStmt>
                    <sourceDesc>
                        <bibl type="digital-source">Kempowski, Walter (2016). Alles umsonst. München: Albrecht Knaus
                            Verlag.</bibl>
                        <bibl type="print-source">Kempowski, Walter (2006). Alles umsonst. München: Albrecht Knaus
                            Verlag.</bibl>
                        <bibl type="edition-first">Kempowski, Walter (2006). Alles umsonst. München: Hanser Verlag.</bibl>
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
                    <change when="2022-05-19" who="#uhk">Initial TEI version.</change>
                </revisionDesc>
            </teiHeader>
            <text>
                <body>
                    <xsl:apply-templates select=".//div[@class='calibre']"/>
                </body>
            </text>
        </TEI>
    </xsl:template>
    
    <xsl:template match="div[@class='calibre']">
        <div type="chapter">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="h1">
        <head>
            <xsl:apply-templates/>
        </head>
    </xsl:template>
    
    <xsl:template match="p[@class=('p_p9')][normalize-space(.)!='']">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="p[@class=('p_p11')]">
        <l>
            <xsl:apply-templates/>
        </l>
    </xsl:template>
    
    <xsl:template match="p[@class='p_p9'][normalize-space(.)='']">
        <milestone rend="space" unit="section" />
    </xsl:template>
    
    <xsl:template match="p[@class=('p_p14','p_p15','p_p16')]">
        <p rend="block">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    
    <xsl:template match="span[@class='t_t2']">
        <emph rend="italics">
            <xsl:apply-templates/>
        </emph>
    </xsl:template>
    
    
    
</xsl:stylesheet>