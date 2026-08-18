resource "google_bigquery_dataset_access" "compliant_example_1" {
  dataset_id    = "compliant_example_1"
  project       = "PDE" 
  role          = "OWNER"
  group_by_email = "user@example.com"  
}
