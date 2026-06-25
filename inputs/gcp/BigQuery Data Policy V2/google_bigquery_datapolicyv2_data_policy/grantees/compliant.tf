resource "google_bigquery_datapolicyv2_data_policy" "compliant_example_1" {
  location         = "australia-southeast1"
  data_policy_id   = "compliant_example_1"
  data_policy_type = "COLUMN_LEVEL_SECURITY_POLICY"
  project          = "PDE"
  grantees = [
    "principal://iam.googleapis.com/projects/-/serviceAccounts/data-reader@pde.iam.gserviceaccount.com"
  ]
}

resource "google_bigquery_datapolicyv2_data_policy" "compliant_example_2" {
  location         = "australia-southeast1"
  data_policy_id   = "compliant_example_2"
  data_policy_type = "COLUMN_LEVEL_SECURITY_POLICY"
  project          = "PDE"
  grantees = [
    "principal://iam.googleapis.com/projects/-/serviceAccounts/data-reader@pde.iam.gserviceaccount.com"
  ]
}

resource "google_bigquery_datapolicyv2_data_policy" "compliant_example_3" {
  location         = "australia-southeast1"
  data_policy_id   = "compliant_example_3"
  data_policy_type = "COLUMN_LEVEL_SECURITY_POLICY"
  project          = "PDE"
  grantees = [
    "principal://iam.googleapis.com/projects/-/serviceAccounts/data-reader@pde.iam.gserviceaccount.com"
  ]
}

resource "google_bigquery_datapolicyv2_data_policy" "compliant_example_4" {
  location         = "australia-southeast1"
  data_policy_id   = "compliant_example_4"
  data_policy_type = "COLUMN_LEVEL_SECURITY_POLICY"
  project          = "PDE"
  grantees = [
    "principal://iam.googleapis.com/projects/-/serviceAccounts/data-reader@pde.iam.gserviceaccount.com"
  ]
}
