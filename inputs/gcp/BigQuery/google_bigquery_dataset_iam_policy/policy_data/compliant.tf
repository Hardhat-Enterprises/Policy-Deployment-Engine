data "google_iam_policy" "c" {
  binding {
    role = "roles/bigquery.dataViewer"
    members = ["user:fakeuser@example.com"]
  }
}

resource "google_bigquery_dataset_iam_policy" "compliant_example_1" {
  dataset_id    = "c"
  project       = "PDE"
  policy_data   = data.google_iam_policy.c.policy_data  
}

data "google_iam_policy" "c" {
  binding {
    role = "roles/bigquery.dataViewer"
    members = ["user:fakeuser@example.com"]
  }
}

resource "google_bigquery_dataset_iam_policy" "compliant_example_2" {
  dataset_id    = "c"
  project       = "PDE"
  policy_data   = data.google_iam_policy.c.policy_data  
}
