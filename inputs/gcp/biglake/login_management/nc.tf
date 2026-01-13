# Non-compliant example for login management policy

resource "google_biglake_service" "nc" {
  resource_name = "biglake-login-non-compliant"
  description  = "Non-compliant login account without MFA"

  login_management {
    mfa_enabled = false
  }
}
