resource "google_bigquery_datapolicyv2_data_policy" "nc1" {
  provider         = google-beta
  location         = "australia-southeast1"
  data_policy_id   = "nc1"
  data_policy_type = "COLUMN_LEVEL_SECURITY_POLICY"
  project          = "PDE"
  grantees = [
    "principalSet://goog/public:all"
  ]
}

resource "google_bigquery_datapolicyv2_data_policy" "nc2" {
  provider         = google-beta
  location         = "australia-southeast1"
  data_policy_id   = "nc2"
  data_policy_type = "COLUMN_LEVEL_SECURITY_POLICY"
  project          = "PDE"
  grantees         = []
}

resource "google_bigquery_datapolicyv2_data_policy" "nc3" {
  provider         = google-beta
  location         = "australia-southeast1"
  data_policy_id   = "nc3"
  data_policy_type = "COLUMN_LEVEL_SECURITY_POLICY"
  project          = "PDE"
  grantees = [
    "principalSet://goog/cloudIdentityCustomerId/C0123456789"
  ]
}

resource "google_bigquery_datapolicyv2_data_policy" "nc4" {
  provider         = google-beta
  location         = "australia-southeast1"
  data_policy_id   = "nc4"
  data_policy_type = "COLUMN_LEVEL_SECURITY_POLICY"
  project          = "PDE"
  grantees = [
    "principal://iam.googleapis.com/users/alice@example.com"
  ]
}
