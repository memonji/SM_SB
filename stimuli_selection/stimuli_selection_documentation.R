# This document has been built in order to give a documentation of the procedure used for selecting stimuli:

###################################################################################################################

#   (A) An exploration of Vispa and Word2Vec models has been performed within 'scripts/sm0-modelExploration_3/*' folder 

###################################################################################################################

#   (B) stimuli have been selected through 'scripts/sm0-modelExploration_3/scripts/main_selection_functions.R' 
#       and a documented csv file 'files/SM_SB_selected_words.csv' has been created.
#       It contains the 60 words selected as stimuli with the relevant information in respect to the Word2Vec and Vispa models.
#       Since our experiment is working on a 3 pairs comparison, a multiple of 3 has been selected as the ideal number of words
#       In order to compute clean operations

###################################################################################################################

#   (C) The file 'files/SM_SB_stimuli_single_words.txt' has been created with the words 'Translation' column from the above csv sheet.
#       It contains the 60 words stimuli and it's a simple txt file with a word for each line.

###################################################################################################################

#   (D) From the single words, a second file 'files/SM_SB_stimuli_pairs.txt' has been created 
#       through the script 'scripts/create_pairs.py'. It's a simple txt file with a unique pair in each 
#       line. The combination of the words is unique and it doesn't take account of the order
#       (e.g. of 'a-b' and 'b-a', only one of the two has been reported)
#       [$ python3 create_pairs.py There are 1770 pairs and 3540 words] in the new file.

###################################################################################################################

#   (E) In order to create the actual trials in the experiment for an optimal distribution, the 'scripts/bestworst_tools/*'
#       from (Hollis, 2018) has been used. You can find the ReadMe in the folder.
#       In this first step, to create the trials 'scripts/bestworst_tools/scripts/create_trials.py'
#       has been used. We modified the script to perform a 3 items distribution, instead of 4 as Hollis performed.
#       This tool has been developed within a Python2 version and therefore the terminal command is:
#       [$ python2 scripts/bestworst_tools/scripts/create_trials.py files/SM_SB_stimuli_pairs.txt > files/SB_SM_stimuli_trials1.csv]

# { Having words_number <- 60, 1770 pairs and 3540 words (create_pairs.py script). Applying the best worst scaling metric, Hollis software create_trials.py script The total number of trials (3 pairs, 6 words) created are 14160 }

#       A file with 6 columns with 1 word in each has been created. Those corresponds to the words we should present in every trial.
#       This is he raw version of the stimuli which should be divided in pairs and tidy up.
#       In order to do this: 

rm(list=ls());
renv::restore();

data <- read.csv("./files/SB_SM_stimuli_trials1.csv", header=FALSE, skip=1);

split_into_two <- function(row) {
  chunks <- lapply(seq(1, length(row), by=2), function(i) paste(row[i:(i+1)], collapse=", "))
  return(chunks)
};

data_split <- lapply(1:nrow(data), function(i) split_into_two(data[i,]));

data_split_df <- as.data.frame(matrix(unlist(data_split), ncol=3, byrow=TRUE));

colnames(data_split_df) <- paste("option", 1:3, sep="");

# Combine the original data with the split columns
final_data <- cbind(data_split_df, data);

colnames(final_data)[4:9] <- paste("word", 1:6, sep="");

# Creating three databases, one universal. One specific for the blind and one specific for the sighted.
write.csv(final_data, "./files/trials_dataframe.csv", row.names=FALSE);
write.csv(final_data, "./files/trials_dataframe_blind.csv", row.names=FALSE);
write.csv(final_data, "./files/trials_dataframe_sighted.csv", row.names=FALSE);

###################################################################################################################

rm(list=ls());
renv::restore();

#   (F) Now we need to spread the trials over the participants.
#       We will have 120 sighted participants and 30 blind participants. The number of participants has been chosen 
#       so to keep the trials number rounded. The total number of trials (3 pairs, 6 words) created are 14160
# The number of trials per participant in order to cover the total amount is:

total_number_trials <- 14160;
participants_number_sighted <- 120;
participants_number_blind <- 30;

trials_for_each_participant_sighted <- total_number_trials / participants_number_sighted;
trials_for_each_participant_blind <- total_number_trials / participants_number_blind;

print(trials_for_each_participant_sighted); # 118
print(trials_for_each_participant_blind); # 472

# Little check
check_sighted <- participants_number_sighted*trials_for_each_participant_sighted;
print(check_sighted);
check_blind <- participants_number_blind*trials_for_each_participant_blind;
print(check_blind);

# Assuming that for 1 trial = 3 pairs the needed time is of 15 sec

total_time_in_sec_sighted <- trials_for_each_participant_sighted*15 ;
total_time_in_min_sighted <- total_time_in_sec_sighted/60;
total_time_in_hrs_sighted <- total_time_in_min_sighted/60;
print(total_time_in_min_sighted); # 29.5
print(total_time_in_hrs_sighted); # 0.4916667

total_time_in_sec_blind <- trials_for_each_participant_blind*15; 
total_time_in_min_blind <- total_time_in_sec_blind/60;
total_time_in_hrs_blind <- total_time_in_min_blind/60;
print(total_time_in_min_blind); # 118
print(total_time_in_hrs_blind); # 1.966667

# We approximated around 30 mins of total experiment duration for the sighted.
# And around 120 mins for the blind.

###################################################################################################################

rm(list=ls());
renv::restore();

# (G)
# At this point, we'll need to distribute the trials among participants in she dataframe.
# We will take words_number <- 60, total_number_trials <- 14160, 
# participants_number_sighted <- 120, participants_number_blind <- 30,

trials_for_each_participant_sighted <- 118;
trials_for_each_participant_blind <- 472;

# Read the csv file where trials distribution is stored
final_data_sighted <- read.csv("./files/trials_dataframe_blind.csv", header = TRUE);
final_data_blind <- read.csv("./files/trials_dataframe_sighted.csv", header = TRUE);

# Create a vector of participant IDs
print(trials_for_each_participant_sighted);
print(trials_for_each_participant_blind);
participant_ids_sighted <- rep(paste0("sbj_sighted_", 1:120), each = trials_for_each_participant_sighted);
participant_ids_blind <- rep(paste0("sbj_blind_", 1:30), each = trials_for_each_participant_blind);

# The distribution of the trials over participants is not randomized by us.
# This is because the bestworst tool already took account for the optimal distribution.

# Add the participant IDs as a new column
final_data_sighted$participant_id <- participant_ids_sighted;
final_data_blind$participant_id <- participant_ids_blind;

# Put the index at the first column
final_data_sighted <- final_data_sighted[, c("participant_id", setdiff(names(final_data_sighted), "participant_id"))];
final_data_blind <- final_data_blind[, c("participant_id", setdiff(names(final_data_blind), "participant_id"))];

# Write the updated data back to a CSV file
write.csv(final_data_sighted, "./files/trials_dataframe_sighted.csv", row.names = FALSE);
write.csv(final_data_blind, "./files/trials_dataframe_blind.csv", row.names = FALSE);

###################################################################################################################

rm(list=ls());
renv::restore();

#   (H) "./files/trials_dataframe_sighted.csv" and "./files/trials_dataframe_blind.csv" are copied in 'audio_data/stimuli_dataframe/'
#   in order to make the retrieval for the dynamical cose easier

###################################################################################################################

rm(list=ls());
renv::restore();

# Additional: Money we would need
# £8/hour
# Pounds -> Euros conversion 1 GBP = 1.16693 EUR

# -----------------------------------------------

# Prolific fees for academia is 25% of taxes https://researcher-help.prolific.com/hc/en-gb/articles/360009223533-What-is-your-pricing 
# Pounds to Euros: pounds amount*1.16876 https://www.xe.com/it/currencyconverter/convert/?Amount=480&From=GBP&To=EUR
# Fees calculator: https://www.prolific.com/calculator

# -------------- SIGHTED -------------------------

# --------- Expected time for the task

# .5 hour * 8pounds * 120 participants
# £480.00 + £160.00 = £640
# 746.8352euros -> 750 euros

# --------- Loose timing 

# Let's consider 40 mins (time that they might need)
# .67 hours * 8pounds * 120 participants
# £640 + £214 = £854  # https://www.prolific.com/calculator
# £853 -> 997euros -> 1000euros


# -------------- BLIND -------------------------
# - We might also go for the 8euros/hour option, to simply things

# --------- Expected time for the task

# 2 hours * 8 pounds * 30 participants
# £480.00
# £560.1264 -> 565euros

# --------- Loose timing 

# Let's consider 130 mins, to be sure
# 2.166667 * 8pounds * 30 participants
# £520 -> 607euros -> 610euros
