
resource "google_identity_platform_tenant_oauth_idp_config" "nc" {
  project       = "identity_platform"
  tenant        = "tenant-id"
  name          = "oidc.invalidprovider"
  display_name  = "Invalid OIDC Provider"
  issuer        = ""  #Blank, invalid issuer
  client_id     = "valid-client-id"
}
