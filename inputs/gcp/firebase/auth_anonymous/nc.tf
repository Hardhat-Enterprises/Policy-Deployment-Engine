# Non-compliant Firebase Authentication: Anonymous sign-in enabled
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_identity_platform_config" "nc" {
  sign_in {
    allow_duplicate_emails = false
    
    anonymous {
      enabled = true
    }
  }
}