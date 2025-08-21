resource "google_bigquery_datapolicy_data_policy" "c" {
  location         = "us-central1"
  data_policy_id   = "data_policy"
  policy_tag       = "Big Query"
  data_policy_type = "COLUMN_LEVEL_SECURITY_POLICY"
  project          = "PDE"
  data_masking_policy {
    predefined_expression = "SHA256"
  }
}
