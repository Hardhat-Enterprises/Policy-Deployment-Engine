resource "google_identity_platform_inbound_saml_config" "nc" {
  project      = "identity_platform"
  name         = "saml.deakin"
  display_name = ""  # INVALID: blank display_name

  idp_config {
    idp_entity_id = "https://idp.deakin.edu.au/entity"
    sso_url       = "https://idp.deakin.edu.au/sso"
    idp_certificates {
      x509_certificate = "INVALID_OR_MISSING_CERT"
    }
  }

  sp_config {
    sp_entity_id = "https://identitytoolkit.googleapis.com/google.identity.identitytoolkit.v1.SamlIdpConfig/saml.deakin"
    callback_uri = "https://your-project.firebaseapp.com/__/auth/handler"
  }
}
