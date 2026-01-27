# Non-compliant example for backup policy

resource "google_biglake_table" "nc" {
  resource_name = "biglake-service-non-compliant"
  description  = "Non-compliant backup configuration"

  backup_config {
    schedule         = "monthly"
    retention_period = "10d"
  }
}
