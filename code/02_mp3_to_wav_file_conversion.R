## Script to convert .mp3 files to .wav files

library(tuneR)

convert_mp3_to_wav <- function(input_folder, output_folder) {

  if (!dir.exists(output_folder)) {
    dir.create(output_folder)
  }

  # get a list of all .mp3 files in the input folder
  mp3_files <- list.files(input_folder, pattern = "\\.mp3$", full.names = TRUE)

  # convert each .mp3 file to .wav format
  for (mp3_file in mp3_files) {

    # load the .mp3 file
    mp3_audio <- readMP3(mp3_file)

    # determine the output .wav file name
    wav_file <- file.path(output_folder, paste0(tools::file_path_sans_ext(basename(mp3_file)), ".wav"))

    # write the audio as .wav file
    writeWave(mp3_audio, filename = wav_file)

    cat("Converted:", mp3_file, "to", wav_file, "\n")
  }

  cat("Conversion completed. Files saved to:", output_folder, "\n")
}

convert_mp3_to_wav("path_to_input_folder",
                   "path_to_output_folder")


