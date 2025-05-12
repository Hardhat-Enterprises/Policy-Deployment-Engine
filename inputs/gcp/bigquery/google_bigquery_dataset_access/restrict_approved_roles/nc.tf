# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_bigquery_dataset_access" "nc" {
  dataset_id = "my_dataset"
  role       = "roles/editor"  # Not in the approved list

  user_by_email = "user@example.com"
}
