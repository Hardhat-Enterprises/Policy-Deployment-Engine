resource "google_bigquery_datapolicy_data_policy" "nc" {
  location         = "australia-southeast1-a"
  data_policy_id   = "data_policy"
  policy_tag       = "Big Query"
  data_policy_type = "DATA_MASKING_POLICY"
  project          = "PDE"
}
