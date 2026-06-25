resource "google_bigquery_datapolicy_data_policy" "compliant_example_1" {
  location         = "australia-southeast1-a"
  data_policy_id   = "compliant_example_1"
  policy_tag       = "Big Query"
  data_policy_type = "COLUMN_LEVEL_SECURITY_POLICY"
  project          = "PDE"
}
