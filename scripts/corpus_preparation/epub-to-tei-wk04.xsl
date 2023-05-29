<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs"
    version="2.0">
    
    <!-- script to transform epub HTML into TEI -->
    <!-- used for: Aus großer Zeit (wk04) -->
    <!-- &ndash; ersetzen durch – -->
    <!-- &nbsp; ersetzen durch Leerzeichen -->
    <xsl:template match="/">
        <TEI xmlns="http://www.tei-c.org/ns/1.0">
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title type="main">Aus großer Zeit</title>
                        <title type="short">Zeit</title>
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
                        <idno type="dhro">...</idno>
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
                    <xsl:apply-templates select=".//div[@class='part' or @id='calibre_link-46' or @id='calibre_link-68']"/>
                </body>
            </text>
        </TEI>
    </xsl:template>
    
    
    <xsl:template match="div[@class='part'][h1[@class='title-part']] | div[@id='calibre_link-46' or @id='calibre_link-68']">
        <div type="part">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="div[@class='part'][.//span[@class=('b1','b')]]">
        <div type="chapter">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="h1 | span[@class=('b1')] | span[@class='calibre8'] | span[@class='b2']">
        <head><xsl:apply-templates/></head>
    </xsl:template>
    
    <xsl:template match="p[@class=('p')][not(br[@class='calibre2'])]">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="p[@class=('p-blocktext', 'p-c-br-blocktext', 'p-indent-blocktext')]">
        <p rend="block"><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="p[@class=('p-d-blocktext', 'p-d-br', 'p3')]">
        <ab><xsl:apply-templates/></ab>
    </xsl:template>
    
    <xsl:template match="br[@class='calibre2']">
        <lb/>
    </xsl:template>
    
    <xsl:template match="p[@class='p'][br[@class='calibre2']]">
        <milestone rend="space" unit="section"/>
    </xsl:template>
    
    <xsl:template match="span[@class='calibre1'][not(span[@class='b1'])]">
        <emph rend="italics"><xsl:apply-templates/></emph>
    </xsl:template>
</xsl:stylesheet>