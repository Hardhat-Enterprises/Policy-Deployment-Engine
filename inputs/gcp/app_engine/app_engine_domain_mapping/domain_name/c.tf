resource "google_app_engine_domain_mapping" "c" {
  project     = "gcp-project-12345"
  domain_name = "hardhatenterprises.com"

  ssl_settings {
    ssl_management_type = "AUTOMATIC"
  }
}