#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# author: Ulrike Henny-Krahmer

'''
This script counts how often markers and antimarkers found with Craig's Zeta
(using stylo) occur in the text samples that stylo produced.
The goal is to identify the text samples with the highest / lowest value
of markers / antimarkers / their sum.
'''

from os.path import join
import glob
import os
import pandas as pd

wdir = "/home/ulrike/Dokumente/Rostock/Lehre/SS_22/Kempowski/stylo_4"
samples = glob.glob(join(wdir, "sample_dump", "*.txt"))
markers = pd.read_csv(join(wdir, "words_preferred.txt"), header=None)
antimarkers = pd.read_csv(join(wdir, "words_avoided.txt"), header=None)
markers_list = list(markers[0])
antimarkers_list = list(antimarkers[0])

print("counting markers and antimarkes in samples")

df = pd.DataFrame(index=samples,columns=["markers","antimarkers","sum"])


for sam in samples:
	with open(sam, "r", encoding="UTF-8") as sam_file:
		sam_text = sam_file.read()
		sam_list = sam_text.split()
		
		markers_in_text = list(set(sam_list).intersection(markers_list))
		antimarkers_in_text = list(set(sam_list).intersection(antimarkers_list))
		num_markers = len(markers_in_text)
		num_antimarkers = len(antimarkers_in_text)
		sum_markers = num_markers - num_antimarkers
		
		df.loc[sam] = [num_markers, num_antimarkers, sum_markers]

df.to_csv(join(wdir, "marker_counter.csv"))

print("done")
