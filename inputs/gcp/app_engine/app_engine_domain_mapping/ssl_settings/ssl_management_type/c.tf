resource "google_app_engine_domain_mapping" "c" {
  project     = "gcp-project-12345"
  domain_name = "verified-domain.com"

  ssl_settings {
    ssl_management_type = "AUTOMATIC"
  }
}