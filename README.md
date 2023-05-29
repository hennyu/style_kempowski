# Style Kempowski

Stylometric analyses of Walter Kempowski's novels

This repository contains scripts and data on stylometric analyses of the novels of the German writer Walter Kempowski (1929-2007).

Analyses were conducted in several contexts:
* the seminar "Stilometrische Analysen der Romane Walter Kempowskis", held at the University of Rostock in the summer semester of 2022
* the talk "Schöne Aussicht: eine stilistische Positionierung im Romanwerk Walter Kempowskis mit digitalen Methoden", held at the conference "Schöne Aussicht von Walter Kempowski" in Haus Kreienhoop (Nartum, Germany) in November 2022
* the paper "Schöne Aussicht: eine stilistische Positionierung im Romanwerk Walter Kempowskis mit digitalen Methoden", submitted for publication in the Kempowski Yearbook

This repository gathers the results from all three contexts. My thanks to the students of the seminar and to Stephan Lesker for participating, thinking along, providing input and asking questions.

The underlying text corpus itself is not included, as the texts are still protected by copyright.

The tool Stylo (version 0.7.4) was used to produce stylometric clusters, PCA plots (both using Classic Delta), and word lists and plots for contrastive analyses (using Craig's Zeta).
See Eder, Maciej/Kestemont, Mike/Rybicki, Jan/Pielström, Steffen: stylo: Stylometric Multivariate Analyses. Version 0.7.4. 2020. https://cran.r-project.org/web/packages/stylo/index.html.

SpaCy (version 3.5.3) and the ce_core_news_md model (version 3.5.0) were used for linguistic tagging.
See Honnibal, Matthew/Montani, Ines/Van Landeghem, Sofie/Boyd, Adriane: spaCy: Industrial-strength Natural Language Processing in Python. Version 3.5.3. 2020. https://doi.org/10.5281/zenodo.1212303.
See Explosion (Hg.): de_core_news_md-3.5.0. 2023. https://github.com/explosion/spacy-models/releases/tag/de_core_news_md-3.5.0.

Plotly.js (version v1.58.5) was used to produce charts.

The scripts were developed and run on Ubuntu 22.04.2 LTS with Python 3.10.6.

## Requirements

* Saxon HE 12
* Python 3 with spacy and pandas

## Licenses

The contents of this repository are published under a GNU General Public License 3, except for the script plotly.js, which is published under an MIT license.

## Citation

Henny-Krahmer, Ulrike (2023): Style Kempowski – Stylometric analyses of Walter Kempowski's novels. Software and Data.
