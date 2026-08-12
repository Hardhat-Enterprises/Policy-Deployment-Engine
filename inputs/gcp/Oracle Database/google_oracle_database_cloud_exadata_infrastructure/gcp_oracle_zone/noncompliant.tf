resource "google_oracle_database_cloud_exadata_infrastructure" "non_compliant_argument" {
  gcp_oracle_zone != "australia-southeast2"
}
