# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_bigquery_dataset_iam_member" "nc" {
  dataset_id = "open_dataset"
  role       = "roles/bigquery.dataViewer"
  member     = "allUsers"
}
