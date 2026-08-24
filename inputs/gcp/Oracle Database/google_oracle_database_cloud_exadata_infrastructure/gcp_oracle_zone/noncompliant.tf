
resource "google_oracle_database_cloud_exadata_infrastructure" "non_compliant_example_1" {
  cloud_exadata_infrastructure_id = "non-compliant-exadata-infra-1"
  location                        = "australia-southeast1"
  gcp_oracle_zone                 = "us-central1"

  properties {
    shape         = "Exadata.X9M"
    compute_count = 2
    storage_count = 3
  }
}
