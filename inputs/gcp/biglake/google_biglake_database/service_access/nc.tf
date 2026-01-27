# Non-compliant example for service access policy

resource "google_biglake_database" "nc" {
  resource_name = "biglake-service-access-non-compliant"
  description   = "Non-compliant service access"

  service_access {
    api_targets {
      service = "storage.googleapis.com"
    }
  }
}
