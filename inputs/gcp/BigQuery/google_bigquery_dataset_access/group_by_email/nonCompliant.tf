resource "google_bigquery_dataset_access" "non_compliant_example_1" {
  dataset_id    = "non_compliant_example_1"
  project       = "PDE" 
  role          = "VIEWER"
  group_by_email = "invalid@gmail.com"  
}
