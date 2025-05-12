# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_bigquery_dataset_access" "c" {
  dataset_id = "my_dataset"
  role       = "roles/bigquery.dataViewer"

  user_by_email = "user@example.com"
}
