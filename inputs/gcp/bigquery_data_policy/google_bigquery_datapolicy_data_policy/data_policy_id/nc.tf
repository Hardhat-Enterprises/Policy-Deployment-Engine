resource "google_bigquery_datapolicy_data_policy" "nc" {
  location         = "us-central1"
  data_policy_id   = ""
  policy_tag       = "Big Query"
  data_policy_type = "COLUMN_LEVEL_SECURITY_POLICY"
  project = "PDE"
}
