# Compliant Firebase Authentication with anonymous sign-in disabled
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_identity_platform_project_default_config" "c" {
  allow_anonymous = false
}
