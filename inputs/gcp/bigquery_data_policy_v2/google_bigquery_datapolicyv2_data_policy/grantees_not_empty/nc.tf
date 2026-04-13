resource "google_bigquery_datapolicyv2_data_policy" "nc" {
  provider         = google-beta
  location         = "us-central1"
  data_policy_id   = "nc"
  data_policy_type = "COLUMN_LEVEL_SECURITY_POLICY"
  project          = "PDE"
  grantees         = []
}
