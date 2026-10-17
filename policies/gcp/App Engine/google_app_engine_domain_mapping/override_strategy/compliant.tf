resource "google_app_engine_domain_mapping" "compliant_example_1" {
  project           = "gcp-project-12345"
  domain_name       = "verified-domain.com"
  override_strategy = "STRICT"

  ssl_settings {
    ssl_management_type = "AUTOMATIC"
  }
}
