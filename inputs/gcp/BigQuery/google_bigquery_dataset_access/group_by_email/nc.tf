resource "google_bigquery_dataset_access" "nc" {
  dataset_id    = "nc"
  project       = "your-gcp-project-id" 
  role          = "VIEWER"
  group_by_email = "invalid@gmail.com"  
}