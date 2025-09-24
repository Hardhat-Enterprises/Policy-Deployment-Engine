resource "google_logging_project_bucket_config" "c" {
   
  project        = "gdce-dev"  
  location       = "global" 
  bucket_id      = "c" 
  
  
  retention_days = 365 
}