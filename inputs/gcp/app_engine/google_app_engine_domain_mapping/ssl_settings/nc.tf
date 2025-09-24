resource "google_app_engine_domain_mapping" "nc" {
  project     = "university-secure-project"
  domain_name = "secure-service.example.com"

  ssl_settings {
    ssl_management_type = "MANUAL"
  }
}
