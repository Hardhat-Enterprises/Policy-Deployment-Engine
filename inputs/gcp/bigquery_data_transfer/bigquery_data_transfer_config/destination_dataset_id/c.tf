resource "google_bigquery_dataset" "my_dataset" "C" {
  depends_on = [google_project_iam_member.permissions]

  dataset_id    = "my_dataset"
  friendly_name = "foo"
  description   = "bar"
  location      = "asia-northeast1"
}