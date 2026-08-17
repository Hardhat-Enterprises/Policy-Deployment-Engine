resource "google_oracle_database_cloud_exadata_infrastructure" "compliant_example_1" {
  cloud_exadata_infrastructure_id = "compliant-example-1"
  display_name                    = "compliant-example-1"
  location                        = "australia-southeast2"
  deletion_policy                 = "PREVENT"
 
  properties {
    shape         = "Exadata.X9M"
    compute_count = 2
    storage_count = 3
  }
}