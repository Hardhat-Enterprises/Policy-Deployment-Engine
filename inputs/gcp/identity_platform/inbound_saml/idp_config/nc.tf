resource "google_identity_platform_inbound_saml_config" "nc" {
  project       = "identity_platform"
  name          = "saml.invalid_provider"
  display_name  = ""

  idp_config {
    idp_entity_id = ""
    sso_url       = ""

    idp_certificates {
      x509_certificate = ""
    }
  }

  sp_config {
    sp_entity_id = ""
    callback_uri = "http://sp.example.com/saml/callback"  # Not HTTPS
  }
}