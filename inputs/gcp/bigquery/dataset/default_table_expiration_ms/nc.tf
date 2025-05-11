# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

# Non-compliant BigQuery dataset with table expiration less than 24 hours but still valid for GCP

resource "google_bigquery_dataset" "nc" {
  project                     = "your-gcp-project-id"  # Replace with your actual project ID
  dataset_id                  = "testgcpdataset_nc"
  location                    = "AU"
  default_table_expiration_ms = 43200000  # 12 hours in milliseconds
}