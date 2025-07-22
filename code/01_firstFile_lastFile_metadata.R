
## Script to extract first file name and time and last file name in time within a folder of folders
## Note: your main folder structure should be as follows
## Main folder --> site1_d1 --> day1 --> day1_time1
##                            ...
##                          ---> dayn -->dayN_timeN

## Output is a .csv with site1_d1, day1_time1 and dayN_timeN

# load required libraries
library(dplyr)

# define a function to process main folder
process_range <- function(range_dir) {
  # Get list of all subdirectories recursively
  all_subdirs <- list.dirs(range_dir, recursive = TRUE, full.names = TRUE)

  # initialize variables to store the first and last file information
  first_file <- NULL
  last_file <- NULL

  for (subdir in all_subdirs) {
    # list all .wav files in the current subdirectory
    wav_files <- list.files(subdir, pattern = "\\.WAV$", full.names = TRUE)

    if (length(wav_files) > 0) {
      # get the first and last file of the current subdirectory by sorting
      sorted_files <- sort(wav_files)
      current_first <- sorted_files[1]
      current_last <- sorted_files[length(sorted_files)]

      if (is.null(first_file) || current_first < first_file) {
        first_file <- current_first
      }

      if (is.null(last_file) || current_last > last_file) {
        last_file <- current_last
      }
    }
  }

  if (is.null(first_file) || is.null(last_file)) {
    warning(paste("No .wav files found in range directory:", range_dir))
    return(NULL)
  }

  # Extract range name
  range_name <- basename(range_dir)

  # Extract first file date and time
  first_date <- substr(basename(first_file), 1, 8)
  first_time <- substr(basename(first_file), 10, 15)

  # Extract last file date and time
  last_date <- substr(basename(last_file), 1, 8)
  last_time <- substr(basename(last_file), 10, 15)

  # Return as a data frame
  data.frame(
    range_name = range_name,
    first_file_date = first_date,
    first_file_time = first_time,
    last_file_date = last_date,
    last_file_time = last_time
  )
}

# Define the path to the base directory where range_name directories are located
# example from this project (change path accordingly)
base_dir <- "E:\\st-vincent-parrot\\data\\Windward South Range\\"

# List all range_name directories
range_dirs <- list.dirs(base_dir, recursive = FALSE)

# Process all range_name directories
results <- lapply(range_dirs, function(dir) {
  res <- process_range(dir)
  if (!is.null(res)) res
})

# Combine all results into a single data frame
final_results <- bind_rows(results)

# Write results to a CSV file
write.csv(final_results, file = "filename.csv", row.names = FALSE)

print("CSV file 'wav_file_summary.csv' created successfully.")


