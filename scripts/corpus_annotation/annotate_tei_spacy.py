#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# author: Ulrike Henny-Krahmer

from os.path import join
import spacy
import pathlib
import glob
import os

#################################
# call_spacy                    #
#################################

def call_spacy(infolder, outfolder):
    """Function to call SpaCy"""
    print("\nLaunched call_spacy.")
    nlp = spacy.load("de_core_news_md")
    inpath = join(infolder, "*.txt")
    infiles = glob.glob(inpath)
    counter = 0
    if not os.path.exists(outfolder):
        os.makedirs(outfolder)
    for infile in infiles: 
        #print(os.path.basename(infile))
        counter+=1
        outfile = join(outfolder, os.path.basename(infile)[:-4] + ".sp")
        #print(outfile)
        doc = nlp(pathlib.Path(infile).read_text(encoding="utf-8"))
        with open(outfile, 'w') as the_file:
            for token in doc:
                the_file.write(token.text + "\t" + token.lemma_ + "\t" + token.pos_ + "\t" + token.tag_ + "\t" + str(token.morph) + "\n")
        
    print("Files treated: ", counter)
    print("Done.")



