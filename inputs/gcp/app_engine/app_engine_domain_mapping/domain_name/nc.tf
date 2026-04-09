resource "google_app_engine_domain_mapping" "nc" {
  project     = "gcp-project-12345"
  domain_name = "random-unverified-site.com"

  ssl_settings {
    ssl_management_type = "AUTOMATIC"
  }
}