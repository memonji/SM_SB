# Clear environment and restore the project
rm(list = ls());

# Function to add response columns based on stimulus conditions
add_response_columns <- function(data) {
  data$best <- ifelse(data$stimulus == "separation_sound_F.mp3", data$response, NA)
  data$worst <- ifelse(data$stimulus == "silence_audio.mp3", data$response, NA)
  data$best_rt <- ifelse(data$stimulus == "separation_sound_F.mp3", data$rt, NA)
  data$worst_rt <- ifelse(data$stimulus == "silence_audio.mp3", data$rt, NA)
  return(data)
};

# Function to process and clean the extracted data
process_data <- function(df) {
  # Remove rows where all selected columns are NA
  df <- df[!apply(is.na(df) | df == "", 1, all), ]
  return(df)
};

# Function to merge non-NA values between consecutive rows
merge_rows <- function(df, start_idx, end_idx) {
  i <- start_idx
  while (i < end_idx) {
    df[i, !is.na(df[i + 1, ])] <- df[i + 1, !is.na(df[i + 1, ])]
    # Remove the next row
    df <- df[-(i + 1), , drop = FALSE]
    # Adjust index if a row is removed
    end_idx <- end_idx - 1
    i <- i + 1
  }
  return(df)
};

# Function to get the corresponding option value
get_option <- function(row, column_name) {
  index <- row[[column_name]]
  return(row[[paste0("option", index)]])
};

# Main function to process the data
process_experiment_data <- function(original_file, trials_file, subj_id, output_file, blind_rows_beginning_number, blind_rows_end_number, beginning_rows_number, final_rows_number, run_id, section) {
  # Read the original data
  original_data <- read.csv(original_file)
  
  # Add response columns
  original_data <- add_response_columns(original_data)
  
  # Extract relevant columns
  extracted_data <- original_data[, c("best", "worst", "best_rt", "worst_rt")]
  
  # Process extracted data
  extracted_data <- process_data(extracted_data)
  
  # Merge rows
  extracted_data <- merge_rows(extracted_data, blind_rows_beginning_number, blind_rows_end_number)
  
  # Read and filter trials data
  trials_dataframe <- read.csv(trials_file)
  trials_dataframe <- subset(trials_dataframe, participant_id == subj_id)
  
  # Combine trials data with extracted data
  max_rows <- max(nrow(trials_dataframe), nrow(extracted_data))
  combined_data <- cbind(trials_dataframe, matrix(NA, nrow = max_rows, ncol = ncol(extracted_data)))
  combined_data[beginning_rows_number:final_rows_number, (ncol(trials_dataframe) + 1):(ncol(trials_dataframe) + ncol(extracted_data))] <- extracted_data
  colnames(combined_data)[(ncol(trials_dataframe) + 1):(ncol(trials_dataframe) + ncol(extracted_data))] <- colnames(extracted_data)
  #combined_data <- combined_data[, !grepl("^word", names(combined_data))]
  combined_data <- combined_data[, !(names(combined_data) %in% paste0("word", 1:6))];
  final_data <- combined_data;
  colnames(final_data)[colnames(final_data) == "best"] <- "best_response";
  colnames(final_data)[colnames(final_data) == "worst"] <- "worst_response";
  
  # Create final data frame
  final_data <- final_data[beginning_rows_number:final_rows_number, ];
  final_data$best <- apply(final_data, 1, function(row) get_option(row, "best_response"));
  final_data$worst <- apply(final_data, 1, function(row) get_option(row, "worst_response"));
  final_data$run_id <- run_id;
  final_data$section <- section;
  
  # Write to CSV
  write.csv(final_data, file = output_file)
};

# Usage
# For blind experiments total rows should be 472 for each participant
# And each section contains 1:118, 119:236, 237:354, 355:472 but plus 1 number which is the title 
# Within the NA nn relevant rows each blind experiment should contain 238 rows, so I guess this should be kept as normal for every blind participant
# blind_rows_end_number = 236 might e different for every section, like the first one is 238
# the second one is 236

setwd("/Users/francesca/Desktop")
# Section 1. blind_rows_end_number 238 
#  beginning_rows_number = 1, final_rows_number = 119
process_experiment_data(
  original_file = './SM_B_data/sm-b-exp_MU_1.csv',
  trials_file = './trials_dataframe_blind.csv',
  subj_id = 'sbj_blind_1',
  output_file = './SM_B_data_processed/sm-b-exp_MU/sm-b-exp_MU_1_processed.csv',
  blind_rows_beginning_number = 1, 
  blind_rows_end_number = 238, 
  beginning_rows_number = 1,
  final_rows_number = 119, 
  run_id = 1, 
  section = 'section 1'
);

# Section 1. blind_rows_end_number 236
# beginning_rows_number = 120, final_rows_number = 237
process_experiment_data(
  original_file = './SM_B_data/sm-b-exp_MU_2.csv',
  trials_file = './trials_dataframe_blind.csv',
  subj_id = 'sbj_blind_1',
  output_file = './SM_B_data_processed/sm-b-exp_MU/sm-b-exp_MU_2_processed.csv',
  blind_rows_beginning_number = 1, 
  blind_rows_end_number = 236, 
  beginning_rows_number = 120,
  final_rows_number = 237, 
  run_id = 2, 
  section = 'section 2'
);

# Section 3. blind_rows_end_number 236
#  beginning_rows_number = 238, final_rows_number = 355
process_experiment_data(
  original_file = './SM_B_data/sm-b-exp_MU_3.csv',
  trials_file = './trials_dataframe_blind.csv',
  subj_id = 'sbj_blind_1',
  output_file = './SM_B_data_processed/sm-b-exp_MU/sm-b-exp_MU_3_processed.csv',
  blind_rows_beginning_number = 1, 
  blind_rows_end_number = 236, 
  beginning_rows_number = 238,
  final_rows_number = 355, 
  run_id = 3, 
  section = 'section 3'
);

# Section 3. blind_rows_end_number 234

process_experiment_data(
  original_file = './SM_B_data/sm-b-exp_MU_4.csv',
  trials_file = './trials_dataframe_blind.csv',
  subj_id = 'sbj_blind_1',
  output_file = './SM_B_data_processed/sm-b-exp_MU/sm-b-exp_MU_4_processed.csv',
  blind_rows_beginning_number = 1, 
  blind_rows_end_number = 234, 
  beginning_rows_number = 356,
  final_rows_number = 472, 
  run_id = 4, 
  section = 'section 4'
);

###############

processed_files <- list(
  read.csv('./SM_B_data_processed/sm-b-exp_MU/sm-b-exp_MU_1_processed.csv'),
  read.csv('./SM_B_data_processed/sm-b-exp_MU/sm-b-exp_MU_2_processed.csv'),
  read.csv('./SM_B_data_processed/sm-b-exp_MU/sm-b-exp_MU_3_processed.csv'),
  read.csv('./SM_B_data_processed/sm-b-exp_MU/sm-b-exp_MU_4_processed.csv')
);

# Combine all data frames into one
final_combined_data <- do.call(rbind, processed_files);

# Write combined data to a CSV file
write.csv(final_combined_data, file = './SM_B_data_processed/sm-b-exp_MU_processed.csv', row.names = FALSE)
