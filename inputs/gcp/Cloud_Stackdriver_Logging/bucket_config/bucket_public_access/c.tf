resource "google_logging_project_bucket_config" "c" {
  #billing_account_bucket_config 
  project        = "gdce-dev" #Required 
  location       = "global" # Approved location  #Required 
  bucket_id      = "c" # Standard naming #Required  
}

