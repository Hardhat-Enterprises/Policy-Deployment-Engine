resource "google_bigquery_datapolicy_data_policy_iam_member" "nc" {
  project = "none"
  location         = "australia-southeast1-a"
  data_policy_id   = "data_policy"
  role = "roles/viewer"
  member = "allUsers"
}