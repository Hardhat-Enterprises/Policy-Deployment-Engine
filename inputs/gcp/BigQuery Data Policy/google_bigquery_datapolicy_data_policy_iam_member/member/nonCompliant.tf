resource "google_bigquery_datapolicy_data_policy_iam_member" "non_compliant_example_1" {
  project        = "PDE"
  location       = "australia-southeast1-a"
  data_policy_id = "non-compliant-example-1"
  role           = "roles/viewer"
  member         = "allUsers"
}

resource "google_bigquery_datapolicy_data_policy_iam_member" "non_compliant_example_2" {
  project        = "PDE"
  location       = "australia-southeast1-a"
  data_policy_id = "non-compliant-example-2"
  role           = "roles/viewer"
  member         = "user:jane@external.com"
} 
