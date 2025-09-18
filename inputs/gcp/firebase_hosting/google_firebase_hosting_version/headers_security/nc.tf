resource "google_firebase_hosting_version" "non_compliant_headers_security" {
  provider = google-beta
  site_id  = var.site_id

  # No security headers provided (non-compliant)
  config {}
}