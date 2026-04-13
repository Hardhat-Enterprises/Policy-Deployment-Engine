resource "google_bigquery_dataset" "c" {
  dataset_id = "c"
  project    = "PDE"
  location   = "australia-southeast1"

  access {
    role          = "OWNER"
    user_by_email = "admin@example.com"
  }
}