### An exploration of semantic maps in sighted and blind individuals
****
**Cognitive Science - Master's Thesis Project**

**Student:** Emma Angela Montecchiari

The project has been developed with Ilaria Appel, which focused on the neural exploration.

**Supervisor:** Davide Crepaldi 

*Language, Learning and Reading Lab - SISSA* (https://lrlac.sissa.it/)

****

### Project Proposal
####  Abstract

The study stands on an exploration of semantic maps, and how their structure might be affected depending on which type of information those maps contain (e.g., visual vs. linguistic). To this aim, we’ll compare neural maps elicited with images vs. words, and cognitive maps in blind vs. sighted individuals.

**** 
The blind participants have been collected in person via Unione Italiana Ciechi di Trieste (https://www.uicitrieste.it/)
and the experiment has been run online. The sighted participants experiment has been managed through Prolific (https://www.prolific.com/).

The study has been approved by SISSA Ethics Committee.

**** 

### Repository Description

This repository contains the material used for collecting behavioural judgements over the semantic maps.

The dynamic scripts for the experiment are:
- *./index_blind.html*
- *./index_sighted.html*.
- 
These two versions have been implemented as the trial distributions and instructions differ slightly between the two. The experiment was run and stored on [Cognition.run] (https://www.cognition.run/) (two different tasks, one for blind participants and one for sighted participants).

#### Directory Structure

#### ****'stimuli_selection/'****
This folder contains the scripts and files used for the selection and storage of stimuli.

- **Documentation:** The description of the steps used to choose and build the stimuli files can be found in *'./stimuli_selection_documentation.R'*.
- **Important Directories:**
  - *'./scripts/bestworst_tools/'*: Contains the software developed by Hollis (2018) for the best-worst scaling technique distribution used for the trials and data analysis.
  - *./scripts/sm0-modelExploration_3/*: Contains the exploration of the models (Word2Vec and Vispa) employed in this study to select the stimuli.

#### ****'input_data/*'****
This folder contains all files serving as stimuli and instructions for the experiment.

- **Audio Data:**
  - *'./audio_data/'*: Contains the audio version of the experiment instructions, stimuli, and division sounds.
  - *'./audio_data/instructions/'*: Contains instruction files for both sighted and blind participants. Some of them are common between the two of them
and those are inside the *'./audio_data/instructions/common/'* folder.
  - *./audio_data/stimuli/:* Contains directories with the categorical selection of stimuli.
    
- **PapaParseFiles**
  - *'./papaParse_files/'*: Contains the necessary files to be uploaded on Cognition.run for the papaParse library.

- **Stimuli Dataframe:**
  - *'./stimuli_dataframe/'*: Contains the .csv files where the stimuli and their distribution over trials are stored. This is the input file that the index scripts will read and associate with the audio file stimuli.

**Note**

All files are organized into different folders for clarity and tidiness. In the actual experiment code, due to Cognition.run settings, the files have been uploaded into a single common directory at the source code level. Therefore, in **'./index_blind.html'** and **'./index_sighted.html'**, the directory paths only include file names without considering different directories.

### Requirements
The dynamical source codes have been implemented over a JsPsych 7.3.4 version, which have been retrieved
online through https://www.jspsych.org/7.3/, papaParse 5.0.2 version (associated files stored in *'input_data/papaParse_files/*'*)
and JavaScript 1.5,

The *'stimuli_selection/scripts/create_pairs.py*' has been developed within a Python 3.11.3 version.
The *'stimuli_selection/scripts/bestworst_tools/*' has been developed within a Python 2.7 version, and we used
a Python 2.7.18 version when using it.
The *'stimuli_selection/scripts/sm0-modelExploration_3/*' has been developed within a R ### version.
The *'stimuli_selection_documentation.R/scripts/sm0-modelExploration_3/stimuli_selection_documentation.R*' has been built within a R version 4.2.3 (2023-03-15) -- "Shortstop Beagle"

****
### Copyright & thanks

**Distributional Semantics Models**

We explored pre-built semantic spaces using the LSAfun package developed by (Günther et al., 2015)

We used a pre-built semantic space developed by Fritz Günther (https://sites.google.com/site/fritzgntr/software-resources/semantic_spaces)
created using the cbow algorithm as implemented in the word2vec model (Mikolov et al., 2013)
using the parameter set shown to produce the best results by (Baroni et al., 2014)

We used ViSpa DSM developed by (Günther et al., 2021. https://vectorswebtool.eu.pythonanywhere.com/#)
The pre-built semantic space we explored is at https://sites.google.com/site/fritzgntr/software-resources/vispa

**Stimuli distribution and data analysis**

The best_worst scaling tools have been built by Geoff Hollis (and Chris Westbury). 
Main work on this in (Hollis, 2018) and (Hollis & Westbury, 2018)

**Lexical Semantics Annotations**
The lexical semantics variables with which we annotated our database come from the work of:
- (Brysbaert et al., 2013)
- (Brysbaert et al. 2018)
- (Scott et al., 2018)

**Text-to-speech tools**

The audio files for instructions and stimuli have been built using https://elevenlabs.io/ for the instructions and
https://speechgen.io/en/tts- for the stimuli.

#### Main References 

- Baroni, M., Dinu, G., & Kruszewski, G. (2014). Don’t count, predict! A systematic comparison of context-counting vs. context-predicting semantic vectors. Annual Meeting of the Association for Computational Linguistics.
- Brysbaert, M., Warriner, A. B., & Kuperman, V. (2014). Concreteness ratings for 40 thousand generally known English word lemmas. Behavior research methods, 46(3), 904–911. https://doi.org/10.3758/s13428-013-0403-5
- Brysbaert, M., Mandera, P., McCormick, S. F., & Keuleers, E. (2019). Word prevalence norms for 62,000 English lemmas. Behavior research methods, 51(2), 467–479. https://doi.org/10.3758/s13428-018-1077-9
- Günther, F., Dudschig, C., & Kaup, B. (2015). LSAfun – An R package for computations based on Latent Semantic Analysis. Behavior Research Methods, 47, 930-944.
- Günther, F., Marelli, M., Tureski, S, & Petilli, M. (2021). ViSpa (Vision Spaces): A computer-vision-based representation system for individual images and concept prototypes, with large-scale evaluation. psyArXiV preprint. https://doi.org/10.31234/osf.io/n4dmq
- Hollis, G., & Westbury, C. (2018). When is best-worst best? A comparison of best-worst scaling, numeric estimation, and rating scales for collection of semantic norms. Behavior research methods, 50(1), 115–133. https://doi.org/10.3758/s13428-017-1009-0
- Hollis G. (2018). Scoring best-worst data in unbalanced many-item designs, with applications to crowdsourcing semantic judgments. Behavior research methods, 50(2), 711–729. https://doi.org/10.3758/s13428-017-0898-2
- Mikolov, T., Chen, K., Corrado, G.S., & Dean, J. (2013). Efficient Estimation of Word Representations in Vector Space. International Conference on Learning Representations.
- Scott, G. G., Keitel, A., Becirspahic, M., Yao, B., & Sereno, S. C. (2019). The Glasgow Norms: Ratings of 5,500 words on nine scales. Behavior research methods, 51(3), 1258–1270. https://doi.org/10.3758/s13428-018-1099-3
