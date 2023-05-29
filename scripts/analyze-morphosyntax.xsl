<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs" xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="2.0">
    
    <!-- This script produces a series of charts to analyze Walter Kempowskis novels
        and those of other authors by
    morho-syntactic characteristics. It uses TEI files including linguistic annotation 
    produced with SpaCy and produces charts with plotly.js. 
    
    @author: Ulrike Henny-Krahmer
    -->
    
    <xsl:variable name="wdir">/home/ulrike/Git/style_kempowski</xsl:variable>
    <xsl:variable name="plotly-script" select="concat($wdir,'/scripts/plotly/plotly.js')"/>
    <xsl:variable name="corpus-dir">/home/ulrike/Dokumente/Rostock/Lehre/SS_22/Kempowski/Korpus/tei_ann_v2</xsl:variable>
    <xsl:variable name="output-dir" select="concat($wdir, '/data/charts_morphosyntax')"/>
    
    <xsl:template match="/">
        
        <!-- Satzlängen bei Kempowski und anderen Autor:innen: -->
        <!--<xsl:call-template name="tokens-pro-satz"/>-->
        
        <!-- Satzlängen bei Kempowski -->
        <!--<xsl:call-template name="tokens-pro-satz-kempowski"/>-->
        
        <!-- Unvollständige Sätze bei Kempowski und anderen Autor:innen -->
        <!--<xsl:call-template name="unvollständige-sätze"/>-->
        
        <!-- Unvollständige Sätze bei Kempowski -->
        <!--<xsl:call-template name="unvollständige-sätze-kempowski"/>-->
        
        <!-- Fragesätze bei Kempowski und anderen Autor:innen -->
        <!--<xsl:call-template name="fragesätze"/>-->
        
        <!-- Direkte Fragesätze bei Kempowski und anderen Autor:innen -->
        <!--<xsl:call-template name="fragesätze-direkt"/>-->
        
        <!-- Indirekte Fragesätze bei Kempowski und anderen Autor:innen -->
        <!--<xsl:call-template name="fragesätze-indirekt"/>-->
        
        <!-- Fragesätze bei Kempowski -->
        <!--<xsl:call-template name="fragesätze-kempowski"/>-->
        
        <!-- Direkte Fragesätze bei Kempowski -->
        <!--<xsl:call-template name="fragesätze-kempowski-direkt"/>-->
        
        <!-- Indirekte Fragesätze bei Kempowski -->
        <!--<xsl:call-template name="fragesätze-kempowski-indirekt"/>-->
        
        <!-- Sätze mit Verben im Indikativ bei Kempowski und anderen Autor:innen -->
        <!--<xsl:call-template name="verben-modus-indikativ"/>-->
        
        <!-- Sätze Verben im Konjunktiv bei Kempowski und anderen Autor:innen -->
        <!--<xsl:call-template name="verben-modus-konjunktiv"/>-->
        
        <!-- Sätze mit Verben im Indikativ und Konjunktiv bei Kempowski und anderen Autor:innen -->
        <!--<xsl:call-template name="verben-modus-indikativ-und-konjunktiv"/>-->
        
        <!-- Sätze mit Verben im Indikativ bei Kempowski -->
        <!--<xsl:call-template name="verben-modus-indikativ-kempowski"/>-->
        
        <!-- Sätze Verben im Konjunktiv bei Kempowski -->
        <!--<xsl:call-template name="verben-modus-konjunktiv-kempowski"/>-->
        
        <!-- Sätze mit Verben im Indikativ und Konjunktiv bei Kempowski -->
        <!--<xsl:call-template name="verben-modus-indikativ-und-konjunktiv-kempowski"/>-->
        
        <!-- Sätze mit Moduswechsel bei Kempowski und anderen Autor:innen -->
        <xsl:call-template name="verben-modus-wechsel"/>
        
        <!-- Sätze mit Moduswechsel bei Kempowski -->
        <xsl:call-template name="verben-modus-wechsel-kempowski"/>
        
    </xsl:template>
    
    
    <xsl:template name="tokens-pro-satz">
        <!-- Satzlängen bei Kempowski und anderen Autor:innen -->
        <xsl:result-document href="{$output-dir}/tokens-pro-satz.html" method="html" encoding="UTF-8">
            <html>
                <head>
                    <!-- Plotly.js -->
                    <script src="{$plotly-script}"></script>
                </head>
                <body>
                    <!-- Plotly chart will be drawn inside this DIV -->
                    <div id="myDiv" style="width: 709px; height: 700px;"></div>
                    <script>
                        var trace1 = {
                        y: [<xsl:for-each select="collection($corpus-dir)//TEI[contains(.//author/name[@type='full'],'Kempowski')]//s">
                            <xsl:value-of select="count(w)"/>
                            <xsl:if test="position()!=last()">,</xsl:if>
                        </xsl:for-each>],
                        type: 'box',
                        name: "Satzlängen Kempowski"
                        };
                        
                        var trace2 = {
                        y: [<xsl:for-each select="collection($corpus-dir)//TEI[not(contains(.//author/name[@type='full'],'Kempowski'))]//s">
                            <xsl:value-of select="count(w)"/>
                            <xsl:if test="position()!=last()">,</xsl:if>
                        </xsl:for-each>],
                        type: 'box',
                        name: "Satzlängen andere"
                        };
                        
                        var data = [trace1, trace2];
                        var layout = {
                        margin: {l: 180, r: 180},
                        title: "Satzlängen bei Kempowski und anderen Autor:innen",
                        font: {
                        family: "Libertine, serif",
                        color: "#000000",
                        size: 14
                        },
                        showlegend: false,
                        yaxis: {
                        title: "Satzlänge in Tokens",
                        tickfont: {size: 14},
                        titlefont: {size: 14}
                        },
                        xaxis: {
                        tickfont: {size: 14}
                        }
                        };
                        
                        Plotly.newPlot('myDiv', data, layout);
                    </script>
                </body>
            </html>
        </xsl:result-document>
        
    </xsl:template>
    
    <xsl:template name="tokens-pro-satz-kempowski">
        <!-- Satzlängen bei Kempowski -->
        <xsl:result-document href="{$output-dir}/tokens-pro-satz-kempowski.html" method="html" encoding="UTF-8">
            <html>
                <head>
                    <!-- Plotly.js -->
                    <script src="{$plotly-script}"></script>
                </head>
                <body>
                    <!-- Plotly chart will be drawn inside this DIV -->
                    <div id="myDiv" style="width: 709px; height: 700px;"></div>
                    <script>
                        <xsl:for-each select="collection($corpus-dir)//TEI[contains(.//author/name[@type='full'],'Kempowski')]">
                            var trace<xsl:value-of select="position()"/> = {
                                y: [<xsl:for-each select=".//s">
                                    <xsl:value-of select="count(w)"/>
                                    <xsl:if test="position()!=last()">,</xsl:if>
                                </xsl:for-each>],
                            type: 'box',
                            name: '<xsl:value-of select=".//title[@type='main']"/>'
                            };
                        </xsl:for-each>
                        
                        
                        
                        var data = [<xsl:for-each select="collection($corpus-dir)//TEI[contains(.//author/name[@type='full'],'Kempowski')]">
                            trace<xsl:value-of select="position()"/>
                            <xsl:if test="position()!=last()">,</xsl:if>
                        </xsl:for-each>];
                        var layout = {
                        margin: {l: 180, r: 180, b: 200},
                        title: "Satzlängen bei Kempowski",
                        font: {
                        family: "Libertine, serif",
                        color: "#000000",
                        size: 14
                        },
                        showlegend: false,
                        yaxis: {
                        title: "Satzlänge in Tokens",
                        tickfont: {size: 14},
                        titlefont: {size: 14}
                        },
                        xaxis: {
                        tickfont: {size: 14}
                        }
                        };
                        
                        Plotly.newPlot('myDiv', data, layout);
                    </script>
                </body>
            </html>
        </xsl:result-document>
        
    </xsl:template>
    
    <xsl:template name="unvollständige-sätze">
        <!-- Unvollständige Sätze bei Kempowski und anderen Autor:innen -->
        <xsl:result-document href="{$output-dir}/unvollständige-sätze.html" method="html" encoding="UTF-8">
            <html>
                <head>
                    <!-- Plotly.js -->
                    <script src="{$plotly-script}"></script>
                </head>
                <body>
                    <!-- Plotly chart will be drawn inside this DIV -->
                    <div id="myDiv" style="width: 709px; height: 500px;"></div>
                    <script>
                        var trace1 = {
                        y: [<xsl:for-each select="collection($corpus-dir)//TEI[contains(.//author/name[@type='full'],'Kempowski')]">
                            <xsl:value-of select="count(.//s[not(.//w[starts-with(substring-after(@pos,'_'),'V')]) or (.//w[contains(@msd,'VerbForm=Inf')] and not(.//w[contains(@msd,'VerbForm=Fin')]))]) div count(.//s)"/>
                            <xsl:if test="position()!=last()">,</xsl:if>
                        </xsl:for-each>],
                        type: 'box',
                        name: "Kempowski"
                        };
                        
                        
                        var trace2 = {
                        y: [<xsl:for-each select="collection($corpus-dir)//TEI[not(contains(.//author/name[@type='full'],'Kempowski'))]">
                            <xsl:value-of select="count(.//s[not(.//w[starts-with(substring-after(@pos,'_'),'V')]) or (.//w[contains(@msd,'VerbForm=Inf')] and not(.//w[contains(@msd,'VerbForm=Fin')]))]) div count(.//s)"/>
                            <xsl:if test="position()!=last()">,</xsl:if>
                        </xsl:for-each>],
                        type: 'box',
                        name: "andere"
                        };
                        
                        var data = [trace1, trace2];
                        var layout = {
                        margin: {l: 180, r: 180},
                        title: "Unvollständige Sätze bei Kempowski und anderen Autor:innen",
                        font: {
                        family: "Libertine, serif",
                        color: "#000000",
                        size: 14
                        },
                        showlegend: false,
                        yaxis: {
                        title: "Anteil unvollständiger Sätze",
                        tickfont: {size: 14},
                        titlefont: {size: 14}
                        },
                        xaxis: {
                        tickfont: {size: 14}
                        }
                        };
                        
                        Plotly.newPlot('myDiv', data, layout);
                    </script>
                </body>
            </html>
        </xsl:result-document>
        
        
    </xsl:template>
    
    <xsl:template name="unvollständige-sätze-kempowski">
        <!-- Unvollständige Sätze bei Kempowski -->
        
        <xsl:result-document href="{$output-dir}/unvollständige-sätze-kempowski.html" method="html" encoding="UTF-8">
            <html>
                <head>
                    <!-- Plotly.js -->
                    <script src="{$plotly-script}"></script>
                </head>
                <body>
                    <!-- Plotly chart will be drawn inside this DIV -->
                    <div id="myDiv" style="width: 709px; height: 700px;"></div>
                    <script>
                        <xsl:for-each select="collection($corpus-dir)//TEI[contains(.//author/name[@type='full'],'Kempowski')]">
                            var trace<xsl:value-of select="position()"/> = {
                            y: [<xsl:value-of select="count(.//s[not(.//w[starts-with(substring-after(@pos,'_'),'V')]) or (.//w[contains(@msd,'VerbForm=Inf')] and not(.//w[contains(@msd,'VerbForm=Fin')]))]) div count(.//s)"/>
                            <xsl:if test="position()!=last()">,</xsl:if>],
                            type: 'box',
                            name: '<xsl:value-of select=".//title[@type='main']"/>'
                            };
                        </xsl:for-each>
                        
                        
                        
                        var data = [<xsl:for-each select="collection($corpus-dir)//TEI[contains(.//author/name[@type='full'],'Kempowski')]">
                            trace<xsl:value-of select="position()"/>
                            <xsl:if test="position()!=last()">,</xsl:if>
                        </xsl:for-each>];
                        var layout = {
                        margin: {l: 180, r: 180, b: 200},
                        title: "Unvollständige Sätze bei Kempowski",
                        font: {
                        family: "Libertine, serif",
                        color: "#000000",
                        size: 14
                        },
                        showlegend: false,
                        yaxis: {
                        title: "Anteil unvollständiger Sätze",
                        tickfont: {size: 14},
                        titlefont: {size: 14}
                        },
                        xaxis: {
                        tickfont: {size: 14}
                        }
                        };
                        
                        Plotly.newPlot('myDiv', data, layout);
                    </script>
                </body>
            </html>
        </xsl:result-document>
        
        
    </xsl:template>
    
    <xsl:template name="fragesätze">
        <!-- Fragesätze bei Kempowski und anderen Autor:innen -->
         <xsl:result-document href="{$output-dir}/fragesätze.html" method="html" encoding="UTF-8">
            <html>
                <head>
                    <script src="{$plotly-script}"></script>
                </head>
                <body>
                    <div id="myDiv" style="width: 709px; height: 500px;"></div>
                    <script>
                        var trace1 = {
                        y: [<xsl:for-each select="collection($corpus-dir)//TEI[contains(.//author/name[@type='full'],'Kempowski')]">
                            <xsl:value-of select="count(.//s[.//w[.='?'] or .//w[substring-after(@pos,'_') = ('PWS','PWAT','PWAV')] or (.//w[@lemma='fragen'] and .//w[.='ob'])]) div count(.//s)"/>
                            <xsl:if test="position()!=last()">,</xsl:if>
                        </xsl:for-each>],
                        type: 'box',
                        name: "Kempowski"
                        };
                        
                        
                        var trace2 = {
                        y: [<xsl:for-each select="collection($corpus-dir)//TEI[not(contains(.//author/name[@type='full'],'Kempowski'))]">
                            <xsl:value-of select="count(.//s[.//w[.='?'] or .//w[substring-after(@pos,'_') = ('PWS','PWAT','PWAV')] or (.//w[@lemma='fragen'] and .//w[.='ob'])]) div count(.//s)"/>
                            <xsl:if test="position()!=last()">,</xsl:if>
                        </xsl:for-each>],
                        type: 'box',
                        name: "andere"
                        };
                        
                        var data = [trace1, trace2];
                        var layout = {
                        margin: {l: 180, r: 180},
                        title: "Fragesätze bei Kempowski und anderen Autor:innen",
                        font: {
                        family: "Libertine, serif",
                        color: "#000000",
                        size: 14
                        },
                        showlegend: false,
                        yaxis: {
                        title: "Anteil an Fragesätzen",
                        tickfont: {size: 14},
                        titlefont: {size: 14}
                        },
                        xaxis: {
                        tickfont: {size: 14}
                        }
                        };
                        
                        Plotly.newPlot('myDiv', data, layout);
                    </script>
                </body>
            </html>
        </xsl:result-document>
        
        
    </xsl:template>
    
    <xsl:template name="fragesätze-direkt">
        <!-- Direkte Fragesätze bei Kempowski und anderen Autor:innen -->
        <xsl:result-document href="{$output-dir}/fragesätze-direkt.html" method="html" encoding="UTF-8">
            <html>
                <head>
                    <script src="{$plotly-script}"></script>
                </head>
                <body>
                    <div id="myDiv" style="width: 709px; height: 500px;"></div>
                    <script>
                        var trace1 = {
                        y: [<xsl:for-each select="collection($corpus-dir)//TEI[contains(.//author/name[@type='full'],'Kempowski')]">
                            <xsl:value-of select="count(.//s[.//w[.='?']]) div count(.//s)"/>
                            <xsl:if test="position()!=last()">,</xsl:if>
                        </xsl:for-each>],
                        type: 'box',
                        name: "Kempowski"
                        };
                        
                        
                        var trace2 = {
                        y: [<xsl:for-each select="collection($corpus-dir)//TEI[not(contains(.//author/name[@type='full'],'Kempowski'))]">
                            <xsl:value-of select="count(.//s[.//w[.='?']]) div count(.//s)"/>
                            <xsl:if test="position()!=last()">,</xsl:if>
                        </xsl:for-each>],
                        type: 'box',
                        name: "andere"
                        };
                        
                        var data = [trace1, trace2];
                        var layout = {
                        margin: {l: 180, r: 180},
                        title: "Direkte Fragesätze bei Kempowski und anderen Autor:innen",
                        font: {
                        family: "Libertine, serif",
                        color: "#000000",
                        size: 14
                        },
                        showlegend: false,
                        yaxis: {
                        title: "Anteil an Fragesätzen",
                        tickfont: {size: 14},
                        titlefont: {size: 14}
                        },
                        xaxis: {
                        tickfont: {size: 14}
                        }
                        };
                        
                        Plotly.newPlot('myDiv', data, layout);
                    </script>
                </body>
            </html>
        </xsl:result-document>
        
    </xsl:template>
    
    <xsl:template name="fragesätze-indirekt">
        <!-- Indirekte Fragesätze bei Kempowski und anderen Autor:innen -->
        <xsl:result-document href="{$output-dir}/fragesätze-indirekt.html" method="html" encoding="UTF-8">
            <html>
                <head>
                    <script src="{$plotly-script}"></script>
                </head>
                <body>
                    <div id="myDiv" style="width: 709px; height: 500px;"></div>
                    <script>
                        var trace1 = {
                        y: [<xsl:for-each select="collection($corpus-dir)//TEI[contains(.//author/name[@type='full'],'Kempowski')]">
                            <xsl:value-of select="count(.//s[not(.//w[.='?']) and (.//w[substring-after(@pos,'_') = ('PWS','PWAT','PWAV')] or (.//w[@lemma='fragen'] and .//w[.='ob']))]) div count(.//s)"/>
                            <xsl:if test="position()!=last()">,</xsl:if>
                        </xsl:for-each>],
                        type: 'box',
                        name: "Kempowski"
                        };
                        
                        
                        var trace2 = {
                        y: [<xsl:for-each select="collection($corpus-dir)//TEI[not(contains(.//author/name[@type='full'],'Kempowski'))]">
                            <xsl:value-of select="count(.//s[not(.//w[.='?']) and (.//w[substring-after(@pos,'_') = ('PWS','PWAT','PWAV')] or (.//w[@lemma='fragen'] and .//w[.='ob']))]) div count(.//s)"/>
                            <xsl:if test="position()!=last()">,</xsl:if>
                        </xsl:for-each>],
                        type: 'box',
                        name: "andere"
                        };
                        
                        var data = [trace1, trace2];
                        var layout = {
                        margin: {l: 180, r: 180},
                        title: "Indirekte Fragesätze bei Kempowski und anderen Autor:innen",
                        font: {
                        family: "Libertine, serif",
                        color: "#000000",
                        size: 14
                        },
                        showlegend: false,
                        yaxis: {
                        title: "Anteil an Fragesätzen",
                        tickfont: {size: 14},
                        titlefont: {size: 14}
                        },
                        xaxis: {
                        tickfont: {size: 14}
                        }
                        };
                        
                        Plotly.newPlot('myDiv', data, layout);
                    </script>
                </body>
            </html>
        </xsl:result-document>
        
    </xsl:template>
    
    <xsl:template name="fragesätze-kempowski">
        <!-- Fragesätze bei Kempowski -->
         <xsl:result-document href="{$output-dir}/fragesätze-kempowski.html" method="html" encoding="UTF-8">
            <html>
                <head>
                    <script src="{$plotly-script}"></script>
                </head>
                <body>
                    <div id="myDiv" style="width: 709px; height: 700px;"></div>
                    <script>
                        <xsl:for-each select="collection($corpus-dir)//TEI[contains(.//author/name[@type='full'],'Kempowski')]">
                            var trace<xsl:value-of select="position()"/> = {
                            y: [<xsl:value-of select="count(.//s[.//w[.='?'] or .//w[substring-after(@pos,'_') = ('PWS','PWAT','PWAV')] or (.//w[@lemma='fragen'] and .//w[.='ob'])]) div count(.//s)"/>
                            <xsl:if test="position()!=last()">,</xsl:if>],
                            type: 'box',
                            name: '<xsl:value-of select=".//title[@type='main']"/>'
                            };
                        </xsl:for-each>
                        
                        
                        var data = [<xsl:for-each select="collection($corpus-dir)//TEI[contains(.//author/name[@type='full'],'Kempowski')]">
                            trace<xsl:value-of select="position()"/>
                            <xsl:if test="position()!=last()">,</xsl:if>
                        </xsl:for-each>];
                        var layout = {
                        margin: {l: 180, r: 180, b: 200},
                        title: "Fragesätze bei Kempowski",
                        font: {
                        family: "Libertine, serif",
                        color: "#000000",
                        size: 14
                        },
                        showlegend: false,
                        yaxis: {
                        title: "Anteil an Fragesätzen",
                        tickfont: {size: 14},
                        titlefont: {size: 14}
                        },
                        xaxis: {
                        tickfont: {size: 14}
                        }
                        };
                        
                        Plotly.newPlot('myDiv', data, layout);
                    </script>
                </body>
            </html>
        </xsl:result-document>
        
    </xsl:template>
    
    <xsl:template name="fragesätze-kempowski-direkt">
        <!-- Direkte Fragesätze bei Kempowski -->
         <xsl:result-document href="{$output-dir}/fragesätze-kempowski-direkt.html" method="html" encoding="UTF-8">
            <html>
                <head>
                    <script src="{$plotly-script}"></script>
                </head>
                <body>
                    <div id="myDiv" style="width: 709px; height: 700px;"></div>
                    <script>
                        <xsl:for-each select="collection($corpus-dir)//TEI[contains(.//author/name[@type='full'],'Kempowski')]">
                            var trace<xsl:value-of select="position()"/> = {
                            y: [<xsl:value-of select="count(.//s[.//w[.='?']]) div count(.//s)"/>
                            <xsl:if test="position()!=last()">,</xsl:if>],
                            type: 'box',
                            name: '<xsl:value-of select=".//title[@type='main']"/>'
                            };
                        </xsl:for-each>
                        
                        
                        var data = [<xsl:for-each select="collection($corpus-dir)//TEI[contains(.//author/name[@type='full'],'Kempowski')]">
                            trace<xsl:value-of select="position()"/>
                            <xsl:if test="position()!=last()">,</xsl:if>
                        </xsl:for-each>];
                        var layout = {
                        margin: {l: 180, r: 180, b: 200},
                        title: "Direkte Fragesätze bei Kempowski",
                        font: {
                        family: "Libertine, serif",
                        color: "#000000",
                        size: 14
                        },
                        showlegend: false,
                        yaxis: {
                        title: "Anteil an Fragesätzen",
                        tickfont: {size: 14},
                        titlefont: {size: 14}
                        },
                        xaxis: {
                        tickfont: {size: 14}
                        }
                        };
                        
                        Plotly.newPlot('myDiv', data, layout);
                    </script>
                </body>
            </html>
        </xsl:result-document>
        
    </xsl:template>
    
    <xsl:template name="fragesätze-kempowski-indirekt">
        <!-- Indirekte Fragesätze bei Kempowski -->
         <xsl:result-document href="{$output-dir}/fragesätze-kempowski-indirekt.html" method="html" encoding="UTF-8">
            <html>
                <head>
                    <script src="{$plotly-script}"></script>
                </head>
                <body>
                    <div id="myDiv" style="width: 709px; height: 700px;"></div>
                    <script>
                        <xsl:for-each select="collection($corpus-dir)//TEI[contains(.//author/name[@type='full'],'Kempowski')]">
                            var trace<xsl:value-of select="position()"/> = {
                            y: [<xsl:value-of select="count(.//s[not(.//w[.='?']) and (.//w[substring-after(@pos,'_') = ('PWS','PWAT','PWAV')] or (.//w[@lemma='fragen'] and .//w[.='ob']))]) div count(.//s)"/>
                            <xsl:if test="position()!=last()">,</xsl:if>],
                            type: 'box',
                            name: '<xsl:value-of select=".//title[@type='main']"/>'
                            };
                        </xsl:for-each>
                        
                        
                        var data = [<xsl:for-each select="collection($corpus-dir)//TEI[contains(.//author/name[@type='full'],'Kempowski')]">
                            trace<xsl:value-of select="position()"/>
                            <xsl:if test="position()!=last()">,</xsl:if>
                        </xsl:for-each>];
                        var layout = {
                        margin: {l: 180, r: 180, b: 200},
                        title: "Indirekte Fragesätze bei Kempowski",
                        font: {
                        family: "Libertine, serif",
                        color: "#000000",
                        size: 14
                        },
                        showlegend: false,
                        yaxis: {
                        title: "Anteil an Fragesätzen",
                        tickfont: {size: 14},
                        titlefont: {size: 14}
                        },
                        xaxis: {
                        tickfont: {size: 14}
                        }
                        };
                        
                        Plotly.newPlot('myDiv', data, layout);
                    </script>
                </body>
            </html>
        </xsl:result-document>
        
        
        
    </xsl:template>
    
    <xsl:template name="verben-modus-indikativ">
        <!-- Sätze mit Verben im Indikativ bei Kempowski und anderen Autor:innen -->
        
        <xsl:result-document href="{$output-dir}/verben-modus-indikativ.html" method="html" encoding="UTF-8">
            <html>
                <head>
                    <script src="{$plotly-script}"></script>
                </head>
                <body>
                    <div id="myDiv" style="width: 809px; height: 500px;"></div>
                    <script>
                        var trace1 = {
                        y: [<xsl:for-each select="collection($corpus-dir)//TEI[contains(.//author/name[@type='full'],'Kempowski')]">
                            <xsl:value-of select="count(.//s[.//w[contains(@msd,'Mood=Ind')]]) div count(.//s)"/>
                            <xsl:if test="position()!=last()">,</xsl:if>
                        </xsl:for-each>],
                        type: 'box',
                        name: "Kempowski"
                        };
                        
                        
                        var trace2 = {
                        y: [<xsl:for-each select="collection($corpus-dir)//TEI[not(contains(.//author/name[@type='full'],'Kempowski'))]">
                            <xsl:value-of select="count(.//s[.//w[contains(@msd,'Mood=Ind')]]) div count(.//s)"/>
                            <xsl:if test="position()!=last()">,</xsl:if>
                        </xsl:for-each>],
                        type: 'box',
                        name: "andere"
                        };
                        
                        var data = [trace1, trace2];
                        var layout = {
                        margin: {l: 180, r: 180},
                        title: "Sätze mit Verben im Indikativ bei Kempowski und anderen Autor:innen",
                        font: {
                        family: "Libertine, serif",
                        color: "#000000",
                        size: 14
                        },
                        showlegend: false,
                        yaxis: {
                        title: "Anteil an Sätzen mit Verben im Indikativ",
                        tickfont: {size: 14},
                        titlefont: {size: 14}
                        },
                        xaxis: {
                        tickfont: {size: 14}
                        }
                        };
                        
                        Plotly.newPlot('myDiv', data, layout);
                    </script>
                </body>
            </html>
        </xsl:result-document>
        
        
    </xsl:template>
    
    <xsl:template name="verben-modus-konjunktiv">
        <!-- Sätze mit Verben im Konjunktiv bei Kempowski und anderen Autor:innen -->
        
        <xsl:result-document href="{$output-dir}/verben-modus-konjunktiv.html" method="html" encoding="UTF-8">
            <html>
                <head>
                    <script src="{$plotly-script}"></script>
                </head>
                <body>
                    <div id="myDiv" style="width: 809px; height: 500px;"></div>
                    <script>
                        var trace1 = {
                        y: [<xsl:for-each select="collection($corpus-dir)//TEI[contains(.//author/name[@type='full'],'Kempowski')]">
                            <xsl:value-of select="count(.//s[.//w[contains(@msd,'Mood=Sub')]]) div count(.//s)"/>
                            <xsl:if test="position()!=last()">,</xsl:if>
                        </xsl:for-each>],
                        type: 'box',
                        name: "Kempowski"
                        };
                        
                        
                        var trace2 = {
                        y: [<xsl:for-each select="collection($corpus-dir)//TEI[not(contains(.//author/name[@type='full'],'Kempowski'))]">
                            <xsl:value-of select="count(.//s[.//w[contains(@msd,'Mood=Sub')]]) div count(.//s)"/>
                            <xsl:if test="position()!=last()">,</xsl:if>
                        </xsl:for-each>],
                        type: 'box',
                        name: "andere"
                        };
                        
                        var data = [trace1, trace2];
                        var layout = {
                        margin: {l: 180, r: 180},
                        title: "Sätze mit Verben im Konjunktiv bei Kempowski und anderen Autor:innen",
                        font: {
                        family: "Libertine, serif",
                        color: "#000000",
                        size: 14
                        },
                        showlegend: false,
                        yaxis: {
                        title: "Anteil an Sätzen mit Verben im Konjunktiv",
                        tickfont: {size: 14},
                        titlefont: {size: 14}
                        },
                        xaxis: {
                        tickfont: {size: 14}
                        }
                        };
                        
                        Plotly.newPlot('myDiv', data, layout);
                    </script>
                </body>
            </html>
        </xsl:result-document>
        
        
    </xsl:template>

    <xsl:template name="verben-modus-indikativ-und-konjunktiv">
        <!-- Sätze mit Verben im Indikativ und Konjunktiv bei Kempowski und anderen Autor:innen -->
        
        <xsl:result-document href="{$output-dir}/verben-modus-indikativ-und-konjunktiv.html" method="html" encoding="UTF-8">
            <html>
                <head>
                    <script src="{$plotly-script}"></script>
                </head>
                <body>
                    <div id="myDiv" style="width: 809px; height: 500px;"></div>
                    <script>
                        var trace1 = {
                        y: [<xsl:for-each select="collection($corpus-dir)//TEI[contains(.//author/name[@type='full'],'Kempowski')]">
                            <xsl:value-of select="count(.//s[.//w[contains(@msd,'Mood=Sub')] and .//w[contains(@msd,'Mood=Ind')]]) div count(.//s)"/>
                            <xsl:if test="position()!=last()">,</xsl:if>
                        </xsl:for-each>],
                        type: 'box',
                        name: "Kempowski"
                        };
                        
                        
                        var trace2 = {
                        y: [<xsl:for-each select="collection($corpus-dir)//TEI[not(contains(.//author/name[@type='full'],'Kempowski'))]">
                            <xsl:value-of select="count(.//s[.//w[contains(@msd,'Mood=Sub')] and .//w[contains(@msd,'Mood=Ind')]]) div count(.//s)"/>
                            <xsl:if test="position()!=last()">,</xsl:if>
                        </xsl:for-each>],
                        type: 'box',
                        name: "andere"
                        };
                        
                        var data = [trace1, trace2];
                        var layout = {
                        margin: {l: 180, r: 180},
                        title: "Sätze mit Verben im Indikativ+Konjunktiv bei Kempowski und anderen",
                        font: {
                        family: "Libertine, serif",
                        color: "#000000",
                        size: 14
                        },
                        showlegend: false,
                        yaxis: {
                        title: "Anteil an Sätzen mit Verben im Indikativ und Konjunktiv",
                        tickfont: {size: 14},
                        titlefont: {size: 14}
                        },
                        xaxis: {
                        tickfont: {size: 14}
                        }
                        };
                        
                        Plotly.newPlot('myDiv', data, layout);
                    </script>
                </body>
            </html>
        </xsl:result-document>
        
        
    </xsl:template>

    <xsl:template name="verben-modus-indikativ-kempowski">
        <!-- Sätze mit Verben im Indikativ bei Kempowski -->
        
        <xsl:result-document href="{$output-dir}/verben-modus-indikativ-kempowski.html" method="html" encoding="UTF-8">
            <html>
                <head>
                    <script src="{$plotly-script}"></script>
                </head>
                <body>
                    <div id="myDiv" style="width: 709px; height: 700px;"></div>
                    <script>
                        <xsl:for-each select="collection($corpus-dir)//TEI[contains(.//author/name[@type='full'],'Kempowski')]">
                            var trace<xsl:value-of select="position()"/> = {
                            y: [<xsl:value-of select="count(.//s[.//w[contains(@msd,'Mood=Ind')]]) div count(.//s)"/>
                            <xsl:if test="position()!=last()">,</xsl:if>],
                            type: 'box',
                            name: '<xsl:value-of select=".//title[@type='main']"/>'
                            };
                        </xsl:for-each>
                        
                        
                        var data = [<xsl:for-each select="collection($corpus-dir)//TEI[contains(.//author/name[@type='full'],'Kempowski')]">
                            trace<xsl:value-of select="position()"/>
                            <xsl:if test="position()!=last()">,</xsl:if>
                        </xsl:for-each>];
                        var layout = {
                        margin: {l: 180, r: 180, b: 200},
                        title: "Sätze mit Verben im Indikativ bei Kempowski",
                        font: {
                        family: "Libertine, serif",
                        color: "#000000",
                        size: 14
                        },
                        showlegend: false,
                        yaxis: {
                        title: "Anteil an Sätzen mit Verben im Indikativ",
                        tickfont: {size: 14},
                        titlefont: {size: 14}
                        },
                        xaxis: {
                        tickfont: {size: 14}
                        }
                        };
                        
                        Plotly.newPlot('myDiv', data, layout);
                    </script>
                </body>
            </html>
        </xsl:result-document>
        
    </xsl:template>
    
    <xsl:template name="verben-modus-konjunktiv-kempowski">
        <!-- Sätze mit Verben im Konjunktiv bei Kempowski -->
        
        <xsl:result-document href="{$output-dir}/verben-modus-konjunktiv-kempowski.html" method="html" encoding="UTF-8">
            <html>
                <head>
                    <script src="{$plotly-script}"></script>
                </head>
                <body>
                    <div id="myDiv" style="width: 709px; height: 700px;"></div>
                    <script>
                        <xsl:for-each select="collection($corpus-dir)//TEI[contains(.//author/name[@type='full'],'Kempowski')]">
                            var trace<xsl:value-of select="position()"/> = {
                            y: [<xsl:value-of select="count(.//s[.//w[contains(@msd,'Mood=Sub')]]) div count(.//s)"/>
                            <xsl:if test="position()!=last()">,</xsl:if>],
                            type: 'box',
                            name: '<xsl:value-of select=".//title[@type='main']"/>'
                            };
                        </xsl:for-each>
                        
                        
                        var data = [<xsl:for-each select="collection($corpus-dir)//TEI[contains(.//author/name[@type='full'],'Kempowski')]">
                            trace<xsl:value-of select="position()"/>
                            <xsl:if test="position()!=last()">,</xsl:if>
                        </xsl:for-each>];
                        var layout = {
                        margin: {l: 180, r: 180, b: 200},
                        title: "Sätze mit Verben im Konjunktiv bei Kempowski",
                        font: {
                        family: "Libertine, serif",
                        color: "#000000",
                        size: 14
                        },
                        showlegend: false,
                        yaxis: {
                        title: "Anteil an Sätzen mit Verben im Konjunktiv",
                        tickfont: {size: 14},
                        titlefont: {size: 14}
                        },
                        xaxis: {
                        tickfont: {size: 14}
                        }
                        };
                        
                        Plotly.newPlot('myDiv', data, layout);
                    </script>
                </body>
            </html>
        </xsl:result-document>
        
    </xsl:template>
    
    <xsl:template name="verben-modus-indikativ-und-konjunktiv-kempowski">
        <!-- Sätze mit Verben im Indikativ und Konjunktiv bei Kempowski -->
        
        <xsl:result-document href="{$output-dir}/verben-modus-indikativ-und-konjunktiv-kempowski.html" method="html" encoding="UTF-8">
            <html>
                <head>
                    <script src="{$plotly-script}"></script>
                </head>
                <body>
                    <div id="myDiv" style="width: 709px; height: 700px;"></div>
                    <script>
                        <xsl:for-each select="collection($corpus-dir)//TEI[contains(.//author/name[@type='full'],'Kempowski')]">
                            var trace<xsl:value-of select="position()"/> = {
                            y: [<xsl:value-of select="count(.//s[.//w[contains(@msd,'Mood=Sub')] and .//w[contains(@msd,'Mood=Ind')]]) div count(.//s)"/>
                            <xsl:if test="position()!=last()">,</xsl:if>],
                            type: 'box',
                            name: '<xsl:value-of select=".//title[@type='main']"/>'
                            };
                        </xsl:for-each>
                        
                        
                        var data = [<xsl:for-each select="collection($corpus-dir)//TEI[contains(.//author/name[@type='full'],'Kempowski')]">
                            trace<xsl:value-of select="position()"/>
                            <xsl:if test="position()!=last()">,</xsl:if>
                        </xsl:for-each>];
                        var layout = {
                        margin: {l: 180, r: 180, b: 300},
                        title: "Sätze mit Verben im Indikativ und Konjunktiv bei Kempowski",
                        font: {
                        family: "Libertine, serif",
                        color: "#000000",
                        size: 14
                        },
                        showlegend: false,
                        yaxis: {
                        title: "Anteil an Sätzen mit Verben im Indikativ+Konjunktiv",
                        tickfont: {size: 14},
                        titlefont: {size: 14}
                        },
                        xaxis: {
                        tickfont: {size: 14}
                        }
                        };
                        
                        Plotly.newPlot('myDiv', data, layout);
                    </script>
                </body>
            </html>
        </xsl:result-document>
        
    </xsl:template>
    
    <xsl:template name="verben-modus-wechsel">
        <!-- Sätze mit Moduswechsel bei Kempowski und anderen Autor:innen -->
        
        <xsl:result-document href="{$output-dir}/verben-modus-wechsel.html" method="html" encoding="UTF-8">
            <html>
                <head>
                    <script src="{$plotly-script}"></script>
                </head>
                <body>
                    <div id="myDiv" style="width: 709px; height: 500px;"></div>
                    <script>
                        var trace1 = {
                        y: [<xsl:for-each select="collection($corpus-dir)//TEI[contains(.//author/name[@type='full'],'Kempowski')]">
                            <xsl:variable name="mood-sub" select=".//s[.//w[contains(@msd,'Mood=Sub')] and not(.//w[contains(@msd,'Mood=Ind')])][following-sibling::s[.//w[contains(@msd,'Mood=Ind')] and not(.//w[contains(@msd,'Mood=Sub')])]]"/>
                            <xsl:variable name="mood-ind" select=".//s[.//w[contains(@msd,'Mood=Ind')] and not(.//w[contains(@msd,'Mood=Sub')])][following-sibling::s[.//w[contains(@msd,'Mood=Sub')] and not(.//w[contains(@msd,'Mood=Ind')])]]"/>
                            <xsl:value-of select="(count($mood-ind) + count($mood-sub)) div count(.//s)"/>
                            <xsl:if test="position()!=last()">,</xsl:if>
                        </xsl:for-each>],
                        type: 'box',
                        name: "Kempowski"
                        };
                        
                        
                        var trace2 = {
                        y: [<xsl:for-each select="collection($corpus-dir)//TEI[not(contains(.//author/name[@type='full'],'Kempowski'))]">
                            <xsl:variable name="mood-sub" select=".//s[.//w[contains(@msd,'Mood=Sub')] and not(.//w[contains(@msd,'Mood=Ind')])][following-sibling::s[.//w[contains(@msd,'Mood=Ind')] and not(.//w[contains(@msd,'Mood=Sub')])]]"/>
                            <xsl:variable name="mood-ind" select=".//s[.//w[contains(@msd,'Mood=Ind')] and not(.//w[contains(@msd,'Mood=Sub')])][following-sibling::s[.//w[contains(@msd,'Mood=Sub')] and not(.//w[contains(@msd,'Mood=Ind')])]]"/>
                            <xsl:value-of select="(count($mood-ind) + count($mood-sub)) div count(.//s)"/>
                            <xsl:if test="position()!=last()">,</xsl:if>
                        </xsl:for-each>],
                        type: 'box',
                        name: "anderee"
                        };
                        
                        var data = [trace1, trace2];
                        var layout = {
                        margin: {l: 180, r: 180},
                        title: "Sätze mit Moduswechsel bei Kempowski und anderen Autor:innen",
                        font: {
                        family: "Libertine, serif",
                        color: "#000000",
                        size: 14
                        },
                        showlegend: false,
                        yaxis: {
                        title: "Anteil an Sätzen mit Moduswechsel",
                        tickfont: {size: 14},
                        titlefont: {size: 14}
                        },
                        xaxis: {
                        tickfont: {size: 14}
                        }
                        };
                        
                        Plotly.newPlot('myDiv', data, layout);
                    </script>
                </body>
            </html>
        </xsl:result-document>
        
    </xsl:template>

    <xsl:template name="verben-modus-wechsel-kempowski">
        <!-- Sätze mit Moduswechsel bei Kempowski -->
        
        <xsl:result-document href="{$output-dir}/verben-modus-wechsel-kempowski.html" method="html" encoding="UTF-8">
            <html>
                <head>
                    <script src="{$plotly-script}"></script>
                </head>
                <body>
                    <div id="myDiv" style="width: 709px; height: 700px;"></div>
                    <script>
                        <xsl:for-each select="collection($corpus-dir)//TEI[contains(.//author/name[@type='full'],'Kempowski')]">
                            var trace<xsl:value-of select="position()"/> = {
                            <xsl:variable name="mood-sub" select=".//s[.//w[contains(@msd,'Mood=Sub')] and not(.//w[contains(@msd,'Mood=Ind')])][following-sibling::s[.//w[contains(@msd,'Mood=Ind')] and not(.//w[contains(@msd,'Mood=Sub')])]]"/>
                            <xsl:variable name="mood-ind" select=".//s[.//w[contains(@msd,'Mood=Ind')] and not(.//w[contains(@msd,'Mood=Sub')])][following-sibling::s[.//w[contains(@msd,'Mood=Sub')] and not(.//w[contains(@msd,'Mood=Ind')])]]"/>
                            y: [<xsl:value-of select="(count($mood-ind) + count($mood-sub)) div count(.//s)"/>
                            <xsl:if test="position()!=last()">,</xsl:if>],
                            type: 'box',
                            name: '<xsl:value-of select=".//title[@type='main']"/>'
                            };
                        </xsl:for-each>
                        
                        
                        var data = [<xsl:for-each select="collection($corpus-dir)//TEI[contains(.//author/name[@type='full'],'Kempowski')]">
                            trace<xsl:value-of select="position()"/>
                            <xsl:if test="position()!=last()">,</xsl:if>
                        </xsl:for-each>];
                        var layout = {
                        margin: {l: 180, r: 180, b: 200},
                        title: "Sätze mit Moduswechsel der Verben bei Kempowski",
                        font: {
                        family: "Libertine, serif",
                        color: "#000000",
                        size: 14
                        },
                        showlegend: false,
                        yaxis: {
                        title: "Anteil an Sätzen mit Moduswechsel bei den Verben",
                        tickfont: {size: 14},
                        titlefont: {size: 14}
                        },
                        xaxis: {
                        tickfont: {size: 14}
                        }
                        };
                        
                        Plotly.newPlot('myDiv', data, layout);
                    </script>
                </body>
            </html>
        </xsl:result-document>
        
        
    </xsl:template>
</xsl:stylesheet>