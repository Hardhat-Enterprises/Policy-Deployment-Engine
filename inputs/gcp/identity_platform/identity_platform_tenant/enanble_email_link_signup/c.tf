resource "google_identity_platform_tenant" "c" {
  project                   = "identity_platform"
  display_name              = "Tenant B"
  allow_password_signup     = true
  enable_email_link_signin = true  # Compliant
}