# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_bigquery_dataset" "nc" {
  dataset_id = "unlabeled_dataset"
}
