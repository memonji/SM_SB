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
  
These two versions have been implemented as the trial distributions and instructions differ slightly between the two. The experiment was run and stored on [Cognition Run][https://www.cognition.run/] (two different tasks, one for blind participants and one for sighted participants).

#### Directory Structure

#### ****'stimuli_selection/'****
This folder contains the scripts and files used for the selection and storage of stimuli.

- **Documentation:** The description of the steps used to choose and build the stimuli files can be found in *'./stimuli_selection_documentation.R'*.
- **Important Directories:**
  - *'./scripts/bestworst_tools/'*: Contains the software developed by Hollis (2018) for the best-worst scaling technique distribution used for the trials and data analysis.
  - *./scripts/sm0-modelExploration_3/*: Contains the exploration of the models (Word2Vec and Vispa) employed in this study to select the stimuli.

#### ****'input_data/'****
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

All files are organized into different folders for clarity and tidiness. In the actual experiment code, due to Cognition.run settings, the files have been uploaded into a single common directory at the source code level. Therefore, in *'./index_blind.html'* and *'./index_sighted.html'*, the directory paths only include file names without considering different directories.

### Requirements

**Dynamical Scripts**

The dynamic scripts for the experiment have been implemented using:

- JsPsych 7.3.4: Retrived through https://www.jspsych.org/7.3/
- PapaParse 5.0.2: Associated files are stored in './input_data/papaParse_files/'
- JavaScript 1.5

**Stimuli Selection Scripts**
- create_pairs.py: Developed with Python 3.11.3
- bestworst_tools/: Developed with Python 2.7, tested using Python 2.7.18
- sm0-modelExploration_3/: Developed with R (specific version needed)
- stimuli_selection_documentation.R: Developed with R version 4.2.3 

****
### Copyright & thanks

**Distributional Semantics Models**

We explored pre-built semantic spaces using the LSAfun package developed by Günther et al. (2015), 
The pre-built semantic spaces we use available at https://sites.google.com/site/fritzgntr/software-resources/semantic_spaces.

- Language-based DSM: This space was created using the CBOW algorithm as implemented in the Word2Vec model (Mikolov et al., 2013), using the parameter set shown to produce the best results by Baroni et al. (2014).
[Available at https://sites.google.com/site/fritzgntr/software-resources/semantic_spaces (*baroni*)]

- Image-based DSM: Developed by Günther et al. (2021). The pre-built semantic space we explored is available at ViSpa Semantic Spaces and the tool at ViSpa DSM Tool.
[Semantic Space Available at https://sites.google.com/site/fritzgntr/software-resources/vispa] [Vispa Tool available at https://vectorswebtool.eu.pythonanywhere.com/#]

**Stimuli distribution and data analysis**

The best-worst scaling tools were built by Geoff Hollis (and Chris Westbury). Main work on this can be found in:

- Hollis (2018)
- Hollis & Westbury (2018)

**Lexical Semantics Annotations**
The lexical semantics variables with which we annotated our database come from the work of:
- Brysbaert et al. (2013)
- Brysbaert et al. (2018)
- Scott et al. (2018)

**Text-to-speech tools**

The audio files for instructions and stimuli were created using:
- Eleven Labs [https://elevenlabs.io] for the instructions
- SpeechGen [https://speechgen.io/en/tts-] for the stimuli

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
