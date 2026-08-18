resource "google_ces_app" "compliant_example_1" {
  app_id             = "app-id"
  location           = "us"
  description        = "Basic CES App example"
  display_name       = "my-app"
  
  client_certificate_settings {
    passphrase      = "example-passphrase"
    private_key     = "projects/my-project/secrets/private-key/versions/1"
    tls_certificate = "-----BEGIN CERTIFICATE-----\nexample\n-----END CERTIFICATE-----"
  }
}