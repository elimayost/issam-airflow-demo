
# Bring needed libraries
library(data.table, warn.conflicts = FALSE)

# Bring utillity functions
source("/cmt/utils/utils.R")

# Read data from GCS
write_stdout("INFO", "Getting the data from GCS")
data <- get_object("country_weapon_suicide.rds")
write_stdout("INFO", "Successfully got the data from GCS")

# Calculation the top 10 dangerous countries
write_stdout("INFO", "Calculating suicide prevalence")
suicide_prevalence <- data[, .(suicide_txt = fcase(suicide == 0, "No", suicide == 1, "Yes"), total = .N), by = .(suicide)][, .(suicide = suicide_txt, total)]
write_stdout("INFO", "Results calculated successfully")

# Saving results locally
data.table::fwrite(suicide_prevalence, "/cmt/data/suicide_prevalence.csv", sep = "|")

# Uploading results file to GCS
write_stdout("INFO", "Uploading results to GCS")
upload_file("suicide_prevalence.csv", "/cmt/data/suicide_prevalence.csv")
write_stdout("INFO", "Uploading results to COS successful")

