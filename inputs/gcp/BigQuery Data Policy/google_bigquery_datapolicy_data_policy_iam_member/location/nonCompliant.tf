resource "google_bigquery_datapolicy_data_policy_iam_member" "non_compliant_example_1" {
  project        = "PDE"
  location       = "us-central1-a"
  data_policy_id = "non-compliant-example-1"
  role           = "roles/viewer"
  member         = "allAuthenticatedUsers"
}
