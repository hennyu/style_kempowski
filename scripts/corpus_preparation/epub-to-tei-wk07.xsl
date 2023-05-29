<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- script to transform epub HTML into TEI -->
    <!-- used for: Hundstage (wk07) -->
    <!-- &ndash; ersetzen durch –
    &mdash; durch — -->
    
    <xsl:template match="/">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title type="main">Hundstage</title>
                        <title type="short">Hundstage</title>
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
                        <idno type="dhro">wk07</idno>
                    </publicationStmt>
                    <sourceDesc>
                        <bibl type="digital-source">Kempowski, Walter (1988). Hundstage. München: Albrecht Knaus
                            Verlag.</bibl>
                        <bibl type="print-source">Kempowski, Walter (1988). Hundstage. München: Albrecht Knaus
                            Verlag.</bibl>
                        <bibl type="edition-first">Kempowski, Walter (1988). Hundstage. München: Hanser Verlag.</bibl>
                    </sourceDesc>
                </fileDesc>
                <encodingDesc>
                    <p/>
                </encodingDesc>
                <revisionDesc>
                    <change when="2022-05-06" who="#uhk">Initial TEI version.</change>
                </revisionDesc>
            </teiHeader>
            <text>
                <body>
                    <xsl:apply-templates select=".//div[@id='calibre_link-52']/div[@class='frontmatter']|.//div[@class='calibre']"/>
                </body>
            </text>
        </TEI>
    </xsl:template>
    
    <xsl:template match="div[@class='frontmatter']">
        <div type="frontmatter">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="div[@class='calibre']">
        <div type="chapter">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="p[@class=('p','p pcalibre','p-indent')]">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="div[@class=('blocktext','box')]/p | p[@class='p-c']">
        <p rend="block">
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="div[@class='blocktext']/p/br | p[@class='p-c']/br">
        <lb/>
    </xsl:template>
    
    <xsl:template match="span[@class='i']">
        <emph rend="italics">
            <xsl:apply-templates/>
        </emph>
    </xsl:template>
    
    <!-- händisch vorbereitet -->
    <xsl:template match="emph[@rend='strong']">
        <emph rend="strong">
            <xsl:apply-templates/>
        </emph>
    </xsl:template>
    
</xsl:stylesheet>