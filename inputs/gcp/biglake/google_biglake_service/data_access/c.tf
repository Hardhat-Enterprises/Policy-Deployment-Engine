# Compliant example for data access policy

resource "google_biglake_service" "c" {
  resource_name = "biglake-data-compliant"
  description   = "Compliant data access with encryption"

  data_access {
    encryption = "AES-256"
  }
}
