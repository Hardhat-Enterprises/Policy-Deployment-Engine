resource "google_logging_project_bucket_config" "nc" {
   #billing_account_bucket_config 
  project        = "gdce-dev" #Required 
  location       = "us-west4" # Non-approved location (Required)
  bucket_id      = "nc" # Non-standard naming (Reqired)
  description    = "" # Missing description (Policy to be tested)
  
}