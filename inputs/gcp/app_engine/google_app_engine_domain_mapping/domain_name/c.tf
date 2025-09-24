resource "google_app_engine_domain_mapping" "c" {
  domain_name = "secure-service.example.com"

  ssl_settings {
    ssl_management_type = "AUTOMATIC"
  }
}
