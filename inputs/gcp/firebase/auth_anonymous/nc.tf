# Non-compliant Firebase Authentication with anonymous sign-in enabled
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_identity_platform_project_default_config" "nc" {
  allow_anonymous = true
}
