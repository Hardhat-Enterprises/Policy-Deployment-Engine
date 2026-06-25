data "google_iam_policy" "c" {
  binding {
    role = "roles/bigquery.dataOwner"
    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_bigquery_table_iam_policy" "compliant_example_1" {
  project     = "PDE"
  dataset_id  = "compliant_example_1"
  table_id    = "table_c1"
  policy_data = data.google_iam_policy.c.policy_data
}

resource "google_bigquery_table_iam_policy" "compliant_example_2" {
  project     = "PDE"
  dataset_id  = "compliant_example_2"
  table_id    = "table_c2"
  policy_data = data.google_iam_policy.c.policy_data
}
