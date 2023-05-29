#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# author: Ulrike Henny-Krahmer

from os.path import join
import subprocess
import annotate_tei_spacy


wdir = "/home/ulrike/Dokumente/Rostock/Lehre/SS_22/Kempowski/Korpus"
saxon = "/home/ulrike/Programs/saxon-he-12.0.jar"

# input: TEI file (change this for each file to be processed)
file_id = "hb03"

### step 1: create IDs for paragraphs

infile = join(wdir, "tei", file_id + ".xml")
outfile = join(wdir, "tei", file_id + "_ids.xml")
xslt = join(wdir, "annotate-tei-1.xsl")

command = "java -jar " + saxon + " -s:" + infile + " -xsl:" + xslt + " -o:" + outfile
subprocess.call(command, shell=True)
print("done: created ids for paragraphs")


### step 2: create text files for all paragraphs

infile = join(wdir, "tei", file_id + "_ids.xml")
xslt = join(wdir, "annotate-tei-2.xsl")

command = "java -jar " + saxon + " -s:" + infile + " -xsl:" + xslt
subprocess.call(command, shell=True)
print("done: created text files for all paragraphs")


### step 3:  annotate paragraphs with SpaCy

### call spacy
### Perform lemmatization and POS tagging.
infolder = join(wdir, "ann_in")
outfolder = join(wdir, "ann_out")
annotate_tei_spacy.call_spacy(infolder, outfolder)
print("done: pos annotation")


### step 4:  integrate POS annotation into TEI files

infile = join(wdir, "tei", file_id + "_ids.xml")
outfile = join(wdir, "tei_ann", file_id + "_ann.xml")
xslt = join(wdir, "annotate-tei-3.xsl")

command = "java -jar " + saxon + " -s:" + infile + " -xsl:" + xslt + " -o:" + outfile
subprocess.call(command, shell=True)
print("done: integrated POS annotation into TEI file")



### step 5: create IDs for words

infile = join(wdir, "tei_ann", file_id + "_ann.xml")
outfile = join(wdir, "tei_ann", file_id + "_ann_ids.xml")
xslt = join(wdir, "annotate-tei-4.xsl")

command = "java -jar " + saxon + " -s:" + infile + " -xsl:" + xslt + " -o:" + outfile
subprocess.call(command, shell=True)
print("done: created ids for words")


### step 6: add sentence markup

infile = join(wdir, "tei_ann", file_id + "_ann_ids.xml")
outfile = join(wdir, "tei_ann", file_id + "_ann_ids_sents.xml")
xslt = join(wdir, "annotate-tei-5.xsl")

command = "java -jar " + saxon + " -s:" + infile + " -xsl:" + xslt + " -o:" + outfile
subprocess.call(command, shell=True)
print("done: added sentence markup")


   
