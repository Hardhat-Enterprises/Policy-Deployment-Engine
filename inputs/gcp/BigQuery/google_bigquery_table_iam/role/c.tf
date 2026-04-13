data "google_iam_policy" "c" {
  binding {
    role = "roles/bigquery.dataOwner"
    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_bigquery_table_iam_policy" "c" {
  project     = "PDE"
  dataset_id  = "c"
  table_id    = "google_bigquery_table.test.table_id"
  policy_data = data.google_iam_policy.c.policy_data
}