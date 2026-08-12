resource "google_oracle_database_cloud_exadata_infrastructure" "non_compliant_argument" {
  cloud_exadata_infrastructure_id = "example-id"
  location                        = "australia-southeast2"
  deletion_policy                 = "DELETE"
}
