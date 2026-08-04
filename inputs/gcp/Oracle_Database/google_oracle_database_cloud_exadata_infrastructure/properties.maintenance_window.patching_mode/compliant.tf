resource "google_oracle_database_cloud_exadata_infrastructure" "compliant_example_1" {
  properties {
    maintenance_window {
      patching_mode = "ROLLING"
    }
  }
}