resource "google_bigquery_datapolicyv2_data_policy" "nc" {
  provider         = google-beta
  location         = "us-central1"
  data_policy_id   = "nc"
  data_policy_type = "DATA_MASKING_POLICY"
  project          = "PDE"

  data_masking_policy {
    predefined_expression = "FIRST_FOUR_CHARACTERS"
  }
}
