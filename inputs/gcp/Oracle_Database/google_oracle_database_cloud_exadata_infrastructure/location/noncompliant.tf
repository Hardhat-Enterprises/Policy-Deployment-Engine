resource "google_oracle_database_cloud_exadata_infrastructure" "non_compliant_example_1" {
  location != "australia-southeast2"
}
