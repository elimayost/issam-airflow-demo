
# Load needed libraries
library(data.table          , warn.conflicts = FALSE)
library(googleAuthR         , warn.conflicts = FALSE)
library(googleCloudStorageR , warn.conflicts = FALSE)

# Logs a message to STDOUT.
write_stdout <- function(level, msg){
    now <- Sys.time()
    sep <- "|"

    writeLines(paste(now, sep, level, sep, msg))
}


# auth to google cloud storage (GCS)
auth <- function() {
  Sys.setenv("GCS_AUTH_FILE" = "/cmt/keys/gcs.json") 
  gcs_auth("/cmt/keys/gcs.json")
}

# Upload file to GCS
upload_file <- function(key, filepath) {
  auth()
  gcs_upload(bucket="eli-airflow", file=filepath, name=key) 
}

# List objects in bucket
list_objects <- function() {
  auth()
  gcs_list_objects(bucket="eli-airflow")
}

# Get object from GCS
get_object <- function(key) {
  auth()
  tmp_file = tempfile()
  gcs_get_object(bucket="eli-airflow", object_name=key, saveToDisk=tmp_file)
  data.table(readRDS(tmp_file))
} 

