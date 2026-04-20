resource "google_bigquery_datapolicyv2_data_policy" "nc" {
  provider         = google-beta
  location         = "australia-southeast1"
  data_policy_id   = "nc"
  data_policy_type = "COLUMN_LEVEL_SECURITY_POLICY"
  project          = "PDE"
  grantees = [
    "principalSet://goog/cloudIdentityCustomerId/C0123456789"
  ]
}
