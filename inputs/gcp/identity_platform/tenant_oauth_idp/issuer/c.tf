
resource "google_identity_platform_tenant_oauth_idp_config" "c" {
  project       = "identity_platform"
  tenant        = "tenant-id"
  name          = "oidc.validprovider"
  display_name  = "Valid OIDC Provider"
  issuer        = "https://accounts.validprovider.com"  # Valid
  client_id     = "valid-client-id"
}
