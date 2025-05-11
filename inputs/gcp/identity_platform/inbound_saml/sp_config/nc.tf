resource "google_identity_platform_inbound_saml_config" "nc" {
  project       = "identity_platform"
  name          = "saml.invalidprovider"
  display_name  = "Invalid SAML Provider"

  idp_config {
    idp_entity_id = "https://idp.example.com/entity"
    sso_url       = "https://idp.example.com/sso"
    idp_certificates {
      x509_certificate = "-----BEGIN CERTIFICATE-----FAKECERTDATA...END CERTIFICATE-----"
    }
  }

  sp_config {
    sp_entity_id = ""                                      # Empty
    callback_uri = "http://app.example.com/saml/callback"  # Not HTTPS
  }
}