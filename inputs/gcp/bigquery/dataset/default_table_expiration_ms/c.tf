# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

# Compliant BigQuery dataset with table expiration of at least 24 hours

resource "google_bigquery_dataset" "c" {
  project                     = "your-gcp-project-id"  # Replace with your actual project ID
  dataset_id                  = "testgcpdataset_c"
  location                    = "AU"
  default_table_expiration_ms = 86400000  # 24 hours in milliseconds
}