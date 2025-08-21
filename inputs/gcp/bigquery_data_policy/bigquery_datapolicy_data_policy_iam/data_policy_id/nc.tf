resource "google_bigquery_datapolicy_data_policy_iam_member" "nc" {
  project = "PDE"
  location         = "australia-southeast1-a"
  data_policy_id   = "none"
  role = "roles/viewer"
  member = "allAuthenticatedUsers"
}