resource "google_ces_app" "non_compliant_example_1" {
  app_id       = "app-id"
  location     = "us"
  description  = "Basic CES App example"
  display_name = "my-app"

  client_certificate_settings {
    tls_certificate = "INVALID-CERTIFICATE-FORMAT"
    private_key     = "-----BEGIN PRIVATE KEY-----\nVALID-PRIVATE-KEY-DATA\n-----END PRIVATE KEY-----"
  }
}