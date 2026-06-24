resource "google_bigquery_datapolicyv2_data_policy" "compliant_example_1" {
  provider         = google-beta
  location         = "australia-southeast1"
  data_policy_id   = "compliant_example_1"
  data_policy_type = "DATA_MASKING_POLICY"
  project          = "PDE"

  data_masking_policy {
    predefined_expression = "SHA256"
  }
}
