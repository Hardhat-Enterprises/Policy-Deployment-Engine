resource "google_bigquery_datapolicyv2_data_policy" "c" {
  provider         = google-beta
  location         = "australia-southeast1"
  data_policy_id   = "c"
  data_policy_type = "COLUMN_LEVEL_SECURITY_POLICY"
  project          = "PDE"
  grantees = [
    "principal://iam.googleapis.com/projects/-/serviceAccounts/data-reader@pde.iam.gserviceaccount.com"
  ]
}
