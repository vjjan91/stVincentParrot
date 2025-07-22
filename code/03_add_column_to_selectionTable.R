## custom script to add a new column with species for each selection table

# Set the working directory to the folder containing the .txt files
setwd("E:\\st-vincent-parrot\\custom-classifier\\2_Testingdata\\st_vincent_amazon")

# Define the output directory
output_dir <- "E:\\st-vincent-parrot\\custom-classifier\\1_Trainingdata\\clippedaudio\\"

# Create the output directory if it doesn't exist
if (!dir.exists(output_dir)) {
  dir.create(output_dir)
}

# List all .txt files in the directory
file_list <- list.files(pattern = "\\.txt$")

# Loop over each file
for (file_name in file_list) {
  # Read the contents of the file into a data frame
  data <- read.table(file_name, header = TRUE, sep = "\t", stringsAsFactors = FALSE, check.names = FALSE)

  # Check if the 'Species' column exists
  if (!"Species" %in% colnames(data)) {
    # Rename columns to ensure they match Raven Pro's expected format
    colnames(data) <- gsub("\\.", " ", colnames(data))

    # Add the 'Species' column and fill it with 'st_vincent_amazon'
    data$Species <- 'st_vincent_amazon'

    # Define the path for the new output file
    output_path <- file.path(output_dir, file_name)

    # Write the modified data frame to the new file using tab as a separator
    write.table(
      data,
      file = output_path,
      sep = "\t",
      row.names = FALSE,
      col.names = TRUE,  # Ensure headers are written
      quote = FALSE      # Disable quoting of entries
    )
  }
}
