
# Set working directory
setwd("/cmt")

# Load needed library
library(data.table, warn.conflicts = FALSE)

# Bring in utility functions
source("/cmt/utils/utils.R")

# Read csv data from URL
write_stdout("INFO", "Downloading data")

data_url <- "https://gitlab.com/eli.mayost/issam-airflow-demo/-/raw/master/data/globalterrorism.csv"
data     <- data.table::fread(data_url, sep = "|")

write_stdout("INFO", paste0("Data download successful (", nrow(data)," rows)"))

# Save file to GCS
write_stdout("INFO", "Saving data to GCS")

saveRDS(data, "/cmt/data/globalterrorism.rds")

upload_file("globalterrorism.rds", "/cmt/data/globalterrorism.rds")

write_stdout("INFO", "Data saved to GCS")

