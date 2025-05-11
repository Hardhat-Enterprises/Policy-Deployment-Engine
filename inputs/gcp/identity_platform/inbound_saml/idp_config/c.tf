resource "google_identity_platform_inbound_saml_config" "c" {
  project      = "identity_platform"
  name         = "saml.valid"
  display_name = "My SAML Config"

  idp_config {
    idp_entity_id = "https://idp.example.com/entity"
    sso_url       = "https://idp.example.com/sso"

    idp_certificates {
      x509_certificate = "-----BEGIN CERTIFICATE-----FAKE...END CERTIFICATE-----"
    }
  }

  sp_config {
    sp_entity_id = "https://sp.example.com/entity"
    callback_uri = "https://sp.example.com/saml/callback"
  }
}