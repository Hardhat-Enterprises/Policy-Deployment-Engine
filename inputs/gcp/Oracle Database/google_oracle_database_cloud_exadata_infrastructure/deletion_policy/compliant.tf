resource "google_oracle_database_cloud_exadata_infrastructure" "compliant_argument" {
  cloud_exadata_infrastructure_id = "example-infrastructure"
  location                        = "australia-southeast2"
  deletion_policy                 = "PREVENT"
}