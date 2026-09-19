resource "google_bigquery_datapolicy_data_policy_iam_member" "compliant_example_1" {
  project        = "PDE"
  location       = "australia-southeast1-a"
  data_policy_id = "compliant-example-1"
  role           = "roles/viewer"
  member         = "user:user@internal.com"
}
