# Compliant example for backup policy

resource "google_biglake_service" "c" {
  resource_name = "biglake-service-compliant"
  description  = "Compliant backup configuration"

  backup_config {
    schedule         = "daily"
    retention_period = "30d"
  }
}
