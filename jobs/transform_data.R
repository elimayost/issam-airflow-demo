
# Bring needed libraries
library(data.table, warn.conflicts = FALSE)

# Bring utillity functions
source("/cmt/utils/utils.R")

# Read data from GCS
write_stdout("INFO", "Getting the data from GCS")
data <- get_object("globalterrorism.rds")
write_stdout("INFO", "Successfully got the data from GCS")

# Pick up columns of interest and remove where "Unknown"
data_cleaned <- data[country_txt != "Unknown" & weaptype1_txt != "Unknown"]

# Select and rename columns
columns_renamed_data <- data_cleaned[, .(year = iyear, country = country_txt, weapon = weaptype1_txt, suicide)]

# Write locally to file
saveRDS(columns_renamed_data, "/cmt/data/country_weapon_suicide.rds")

# upload to GCS
write_stdout("INFO", "Uploading data to GCS")
upload_file("country_weapon_suicide.rds", "/cmt/data/country_weapon_suicide.rds")
write_stdout("INFO", "Uploading data to GCS successful")

