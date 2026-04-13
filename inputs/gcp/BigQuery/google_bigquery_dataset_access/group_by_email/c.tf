resource "google_bigquery_dataset_access" "c" {
  dataset_id     = "c"
  project        = "PDE"
  role           = "OWNER"
  group_by_email = "user@example.com"
}