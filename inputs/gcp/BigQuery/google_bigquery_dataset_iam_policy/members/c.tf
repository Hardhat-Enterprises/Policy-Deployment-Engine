data "google_iam_policy" "c" {
  binding {
    role = "roles/bigquery.dataViewer"
    members = ["user:fakeuser@example.com"]
  }
}

resource "google_bigquery_dataset_iam_policy" "c" {
  dataset_id    = "c"
  project       = "fake-project-123"
  policy_data   = data.google_iam_policy.c.policy_data  
}