# Non-compliant example for data access policy

resource "google_biglake_service" "nc" {
  resource_name = "biglake-data-non-compliant"
  description   = "Non-compliant data access without encryption"

  data_access {
    encryption = "None"
  }
}
