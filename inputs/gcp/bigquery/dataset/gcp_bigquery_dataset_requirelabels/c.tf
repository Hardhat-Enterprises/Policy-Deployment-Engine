# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_bigquery_dataset" "c" {
  dataset_id = "labeled_dataset"

  labels = {
    environment = "prod"
    cost_center = "finance"
  }
}
