resource "google_app_engine_domain_mapping" "nc_ssl" {
  domain_name = "no-ssl-service.example.com"
}

resource "google_app_engine_domain_mapping" "nc_domain" {
  domain_name = "unapproved-domain.com"

  ssl_settings {
    ssl_management_type = "AUTOMATIC"
  }
}
