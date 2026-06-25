resource "google_bigquery_datapolicyv2_data_policy" "non_compliant_example_1" {
  location         = "australia-southeast1"
  data_policy_id   = "non_compliant_example_1"
  data_policy_type = "DATA_MASKING_POLICY"
  project          = "PDE"

  data_masking_policy {
    predefined_expression = "FIRST_FOUR_CHARACTERS"
  }
}
