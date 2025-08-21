resource "google_bigquery_datapolicy_data_policy" "c" {
  location         = "australia-southeast1-a"
  data_policy_id   = "data_policy"
  policy_tag       = "Big Query"
  data_policy_type = "COLUMN_LEVEL_SECURITY_POLICY"
  project          = "PDE"
}
