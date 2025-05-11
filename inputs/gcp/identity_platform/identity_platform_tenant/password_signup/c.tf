resource "google_identity_platform_tenant" "c" {
  project                = "identity_platform"
  display_name           = "Tenant A"
  allow_password_signup  = true  #Compliant
}