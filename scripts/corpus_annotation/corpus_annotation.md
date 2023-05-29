How to: preparation and annotation Kempowski corpus

(corpus text files are not included in this repository)

sources: ebooks (epubs)

processing steps:

1: get the HTML file from the epubs (converted to output format HTMLZ with Calibre); extract HTMLZ, take index.html.
2: convert to raw TEI format with epub-to-tei.xsl
3: edit the TEI manually (correct structure of parts/chapters, add metadata to header), store result in folder "tei"
4: POS annotation with the Python script annotate_tei_pipeline.py (this integrates further XSLT/Python scripts for partial steps), the final result of the annotation process is stored in the folder "tei_ann", intermediate steps are deleted again
5: create derived text formats, if needed (extract-fulltext.xsl, extract-annotated-text.xsl)

