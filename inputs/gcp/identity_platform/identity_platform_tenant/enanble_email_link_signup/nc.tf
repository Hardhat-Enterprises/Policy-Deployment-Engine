resource "google_identity_platform_tenant" "nc" {
  project                   = "identity_platform"
  display_name              = "Tenant B"
  allow_password_signup     = true
  enable_email_link_signin = false  # Not allowed
}