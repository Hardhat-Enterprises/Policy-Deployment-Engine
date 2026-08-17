resource "google_oracle_database_cloud_exadata_infrastructure" "non_compliant_example_1" {
  cloud_exadata_infrastructure_id = "non-compliant-example-1"
  display_name                    = "non-compliant-example-1"
  location                        = "australia-southeast2"
  deletion_policy                 = "DELETE"

  properties {
    shape         = "Exadata.X9M"
    compute_count = 2
    storage_count = 3
  }
}
