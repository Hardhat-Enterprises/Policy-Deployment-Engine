resource "google_bigquery_dataset" "nc" {
  dataset_id    = "nc"
  project       = "PDE" 
  location      = "australia-southeast1"

  access {
    role           = "roles/bigquery.dataEditor"
    group_by_email = "invalid@gmail.com"
  }

}
