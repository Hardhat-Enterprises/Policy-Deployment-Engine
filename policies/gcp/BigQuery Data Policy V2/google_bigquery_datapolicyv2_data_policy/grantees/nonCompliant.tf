resource "google_bigquery_datapolicyv2_data_policy" "non_compliant_example_1" {
  location         = "australia-southeast1"
  data_policy_id   = "non_compliant_example_1"
  data_policy_type = "COLUMN_LEVEL_SECURITY_POLICY"
  project          = "PDE"
  grantees = [
    "principalSet://goog/public:all"
  ]
}

resource "google_bigquery_datapolicyv2_data_policy" "non_compliant_example_2" {
  location         = "australia-southeast1"
  data_policy_id   = "non_compliant_example_2"
  data_policy_type = "COLUMN_LEVEL_SECURITY_POLICY"
  project          = "PDE"
  grantees         = []
}

resource "google_bigquery_datapolicyv2_data_policy" "non_compliant_example_3" {
  location         = "australia-southeast1"
  data_policy_id   = "non_compliant_example_3"
  data_policy_type = "COLUMN_LEVEL_SECURITY_POLICY"
  project          = "PDE"
  grantees = [
    "principalSet://goog/cloudIdentityCustomerId/C0123456789"
  ]
}

resource "google_bigquery_datapolicyv2_data_policy" "non_compliant_example_4" {
  location         = "australia-southeast1"
  data_policy_id   = "non_compliant_example_4"
  data_policy_type = "COLUMN_LEVEL_SECURITY_POLICY"
  project          = "PDE"
  grantees = [
    "principal://iam.googleapis.com/users/alice@example.com"
  ]
}
