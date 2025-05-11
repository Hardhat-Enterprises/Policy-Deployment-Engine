resource "google_identity_platform_tenant" "nc" {
  project                = "identity_platform"
  display_name           = "Tenant A"
  allow_password_signup  = false  #Not allowed
}