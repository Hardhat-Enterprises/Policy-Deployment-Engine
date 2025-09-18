resource "google_firebase_hosting_version" "compliant_headers_security" {
  provider = google-beta
  site_id  = var.site_id

  config {}
}