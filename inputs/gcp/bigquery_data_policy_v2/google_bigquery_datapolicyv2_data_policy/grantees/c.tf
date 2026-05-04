resource "google_bigquery_datapolicyv2_data_policy" "c1" {
  provider         = google-beta
  location         = "australia-southeast1"
  data_policy_id   = "c1"
  data_policy_type = "COLUMN_LEVEL_SECURITY_POLICY"
  project          = "PDE"
  grantees = [
    "principal://iam.googleapis.com/projects/-/serviceAccounts/data-reader@pde.iam.gserviceaccount.com"
  ]
}

resource "google_bigquery_datapolicyv2_data_policy" "c2" {
  provider         = google-beta
  location         = "australia-southeast1"
  data_policy_id   = "c2"
  data_policy_type = "COLUMN_LEVEL_SECURITY_POLICY"
  project          = "PDE"
  grantees = [
    "principal://iam.googleapis.com/projects/-/serviceAccounts/data-reader@pde.iam.gserviceaccount.com"
  ]
}

resource "google_bigquery_datapolicyv2_data_policy" "c3" {
  provider         = google-beta
  location         = "australia-southeast1"
  data_policy_id   = "c3"
  data_policy_type = "COLUMN_LEVEL_SECURITY_POLICY"
  project          = "PDE"
  grantees = [
    "principal://iam.googleapis.com/projects/-/serviceAccounts/data-reader@pde.iam.gserviceaccount.com"
  ]
}

resource "google_bigquery_datapolicyv2_data_policy" "c4" {
  provider         = google-beta
  location         = "australia-southeast1"
  data_policy_id   = "c4"
  data_policy_type = "COLUMN_LEVEL_SECURITY_POLICY"
  project          = "PDE"
  grantees = [
    "principal://iam.googleapis.com/projects/-/serviceAccounts/data-reader@pde.iam.gserviceaccount.com"
  ]
}
