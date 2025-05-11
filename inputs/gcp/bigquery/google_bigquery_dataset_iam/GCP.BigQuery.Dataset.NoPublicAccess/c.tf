# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_bigquery_dataset_iam_member" "c" {
  dataset_id = "secure_dataset"
  role       = "roles/bigquery.dataViewer"
  member     = "user:example-user@example.com"
}
