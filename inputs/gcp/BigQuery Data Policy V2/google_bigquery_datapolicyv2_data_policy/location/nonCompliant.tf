resource "google_bigquery_datapolicyv2_data_policy" "non_compliant_example_1" {
  provider         = google-beta
  location         = "europe-west1"
  data_policy_id   = "non_compliant_example_1"
  data_policy_type = "COLUMN_LEVEL_SECURITY_POLICY"
  project          = "PDE"
  grantees = [
    "principal://iam.googleapis.com/projects/-/serviceAccounts/data-reader@pde.iam.gserviceaccount.com"
  ]
}
