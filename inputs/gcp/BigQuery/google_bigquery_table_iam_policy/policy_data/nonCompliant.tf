data "google_iam_policy" "nc" {
  binding {
    role = "roles/bigquery.dataOwner"
    members = [
      "allUsers",
    ]
  }
}

resource "google_bigquery_table_iam_policy" "non_compliant_example_1" {
  project     = "PDE"
  dataset_id  = "non_compliant_example_1"
  table_id    = "table_nc1"
  policy_data = data.google_iam_policy.nc.policy_data
}

data "google_iam_policy" "nc2" {
  binding {
    role = "roles/editor"
    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_bigquery_table_iam_policy" "non_compliant_example_2" {
  project     = "PDE"
  dataset_id  = "non_compliant_example_2"
  table_id    = "table_nc2"
  policy_data = data.google_iam_policy.nc2.policy_data
}
