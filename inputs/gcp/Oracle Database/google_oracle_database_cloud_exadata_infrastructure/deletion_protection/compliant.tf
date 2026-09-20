resource "google_oracle_database_cloud_exadata_infrastructure" "compliant_example_1" {
  cloud_exadata_infrastructure_id = "compliant-exadata-infra-1"
  location                        = "australia-southeast1"
  deletion_protection             = true

  properties {
    shape         = "Exadata.X9M"
    compute_count = 2
    storage_count = 3
  }
}
