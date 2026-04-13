data "google_iam_policy" "nc" {
  binding {
    role = "roles/invalid"
    members = [
      "allUsers",
    ]
  }
}

resource "google_bigquery_table_iam_policy" "nc" {
  project     = "PDE"
  dataset_id  = "nc"
  table_id    = "google_bigquery_table.test.table_id"
  policy_data = data.google_iam_policy.nc.policy_data
}