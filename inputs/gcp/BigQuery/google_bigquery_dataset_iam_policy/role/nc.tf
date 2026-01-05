data "google_iam_policy" "nc" {
  binding {
    role = "roles/invalid"
    members = ["allUsers"]  
  }
}

resource "google_bigquery_dataset_iam_policy" "nc" {
  dataset_id    = "nc"
  project       = "fake-project-123"
  policy_data   = data.google_iam_policy.nc.policy_data
}