resource "google_identity_platform_tenant_oauth_idp_config" "nc" {
  project       = "identity_platform"
  tenant        = ""  #  Blank tenant violates policy
  name          = "oidc.invalidprovider"
  display_name  = "Invalid OIDC Provider"
  issuer        = "https://accounts.validprovider.com"
  client_id     = "valid-client-id"
}