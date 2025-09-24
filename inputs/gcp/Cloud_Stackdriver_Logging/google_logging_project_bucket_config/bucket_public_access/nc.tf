resource "google_logging_project_bucket_config" "nc" {
 
  project        = "gdce-dev" 
  location       = "us-west4" 
  bucket_id      = "nc" 
}