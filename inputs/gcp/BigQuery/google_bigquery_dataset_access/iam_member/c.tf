resource "google_bigquery_dataset_access" "c" {
  dataset_id    = "c"
  project       = "your-gcp-project-id" 
  role          = "OWNER"
  iam_member = "user@example.com"
}