resource "google_identity_platform_inbound_saml_config" "c" {
  project       = "identity_platform"
  name          = "saml.deakin"
  display_name  = "deakin"

  idp_config {
    idp_entity_id = "https://signon.deakin.edu.au/idp/profile/SAML2/Redirect/SSO"
    sso_url       = "https://signon.deakin.edu.au/idp/profile/SAML2/Redirect/SSO"
    idp_certificates {
      x509_certificate = "-----BEGIN CERTIFICATE-----FAKECERTDATA...END CERTIFICATE-----"
    }
  }

  sp_config {
    sp_entity_id = "https://sp.example.com/entity"
    callback_uri = "https://app.example.com/saml/callback"  #HTTPS
  }
}