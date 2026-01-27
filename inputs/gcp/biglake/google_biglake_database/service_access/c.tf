# Compliant example for service access policy

resource "google_biglake_database" "c" {
  resource_name = "biglake-service-access-compliant"
  description   = "Compliant service access"

  service_access {
    api_targets {
      service = "maps.googleapis.com"
    }
  }
}
