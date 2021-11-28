
# Bring needed libraries
library(data.table, warn.conflicts = FALSE)

# Bring utillity functions
source("/cmt/utils/utils.R")

# Read data from GCS
write_stdout("INFO", "Getting the data from GCS")
data <- get_object("country_weapon_suicide.rds")
write_stdout("INFO", "Successfully got the data from GCS")

# Calculation the top 10 dangerous countries
write_stdout("INFO", "Calculating top 10 most dangerous countries")
top_10_dangerous_countries <- data[, .(total = .N), by = .(country)][order(total, decreasing = TRUE)][1:10]
write_stdout("INFO", "Results calculated successfully")

# Saving results locally
data.table::fwrite(top_10_dangerous_countries, "/cmt/data/top_10_dangerous_countries.csv", sep = "|")

# Uploading results file to GCS
write_stdout("INFO", "Uploading results to GCS")
upload_file("top_10_dangerous_countries.csv", "/cmt/data/top_10_dangerous_countries.csv")
write_stdout("INFO", "Uploading results to GCS successful")

