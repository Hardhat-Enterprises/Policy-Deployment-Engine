resource "google_identity_platform_inbound_saml_config" "nc" {
  project       = "identity_platform"
  name          = "saml.invalid_provider"
  display_name  = ""  # Required but left empty

  idp_config {
    idp_entity_id = ""  # Empty
    sso_url       = ""  # Empty

    idp_certificates {
      x509_certificate = "" # Empty
    }
  }

  sp_config {
    sp_entity_id = ""  # Empty
    callback_uri = "http://sp.example.com/saml/callback"  # Not HTTPS
  }
}