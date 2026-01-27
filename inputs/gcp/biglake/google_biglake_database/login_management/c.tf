# Compliant example for login management policy

resource "google_biglake_database" "c" {
  resource_name = "biglake-login-compliant"
  description  = "Compliant login account with MFA enabled"

  login_management {
    mfa_enabled = true
  }
}
