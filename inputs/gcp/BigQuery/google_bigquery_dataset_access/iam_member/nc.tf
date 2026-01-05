resource "google_bigquery_dataset_access" "nc" {
  dataset_id    = "nc"
  project       = "your-gcp-project-id" 
  role          = "VIEWER"
  iam_member = "allUsers"
}