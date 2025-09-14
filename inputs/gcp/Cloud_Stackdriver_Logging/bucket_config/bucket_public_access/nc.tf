resource "google_logging_project_bucket_config" "nc" {
 
  project        = "gdce-dev" #Required 
  location       = "us-west4" # Non-approved location (Required)
  bucket_id      = "nc" #gives public access
}