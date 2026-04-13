resource "google_app_engine_domain_mapping" "nc" {
  project           = "gcp-project-12345"
  domain_name       = "unverified-domain.com"
  override_strategy = "OVERRIDE"

  ssl_settings {
    ssl_management_type = "AUTOMATIC"
  }
}