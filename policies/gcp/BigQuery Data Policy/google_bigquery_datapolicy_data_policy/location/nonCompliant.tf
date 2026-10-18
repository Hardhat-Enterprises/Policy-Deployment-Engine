resource "google_bigquery_datapolicy_data_policy" "non_compliant_example_1" {
  location         = "us-central1-a"
  data_policy_id   = "non_compliant_example_1"
  policy_tag       = "Big Query"
  data_policy_type = "COLUMN_LEVEL_SECURITY_POLICY"
  project          = "PDE"
}
