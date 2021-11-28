
# Bring needed libraries
library(rmarkdown, warn.conflicts = FALSE)

# Bring in utility functions
source("/cmt/utils/utils.R")

# generate html report from the markdown file
write_stdout("INFO", "Generating demo report")

# Convert RMarkdown to html
rmarkdown::render(
    input = paste0("/cmt/report/generate_report.Rmd"),
    output_file = paste0("/cmt/report/report.html"),
    quiet = TRUE
)

write_stdout("INFO", "Report htlm file generated")

# Upload report to GCS
write_stdout("INFO", "Uploading report to GCS")
upload_file("report.html", "/cmt/report/report.html")
write_stdout("INFO", "Uploading report to GCS successful")

