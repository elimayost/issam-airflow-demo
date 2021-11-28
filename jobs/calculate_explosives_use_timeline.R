
# Bring needed libraries
library(data.table, warn.conflicts = FALSE)

# Bring utillity functions
source("/cmt/utils/utils.R")

# Read data from GCS
write_stdout("INFO", "Getting the data from GCS")
data <- get_object("country_weapon_suicide.rds")
write_stdout("INFO", "Successfully got the data from GCS")

# Calculation explosives use timeline
write_stdout("INFO", "Calculating explosives use timeline")
explosives_use_timeline <- data[weapon == "Explosives", .(total = .N), by = .(year)]
write_stdout("INFO", "Results calculated successfully")

# Saving results locally
data.table::fwrite(explosives_use_timeline, "/cmt/data/explosives_use_timeline.csv", sep = "|")

# Uploading results file to GCS
write_stdout("INFO", "Uploading results to GCS")
upload_file("explosives_use_timeline.csv", "/cmt/data/explosives_use_timeline.csv")
write_stdout("INFO", "Uploading results to GCS successful")

