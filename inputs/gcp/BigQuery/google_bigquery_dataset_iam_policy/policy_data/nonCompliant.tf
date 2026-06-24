data "google_iam_policy" "nc" {
  binding {
    role = "roles/bigquery.dataViewer"
    members = ["allUsers"]  
  }
}

resource "google_bigquery_dataset_iam_policy" "non_compliant_example_1" {
  dataset_id    = "nc"
  project       = "PDE"
  policy_data   = data.google_iam_policy.nc.policy_data
}

data "google_iam_policy" "nc" {
  binding {
    role = "roles/invalid"
    members = ["allUsers"]  
  }
}

resource "google_bigquery_dataset_iam_policy" "non_compliant_example_2" {
  dataset_id    = "nc"
  project       = "PDE"
  policy_data   = data.google_iam_policy.nc.policy_data
}
