# Compliant Firebase Authentication: Anonymous sign-in disabled
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_identity_platform_config" "c" {
  sign_in {
    allow_duplicate_emails = false
    
    anonymous {
      enabled = false
    }
  }
}