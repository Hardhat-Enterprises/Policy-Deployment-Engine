resource "google_firebase_hosting_custom_domain" "c" {
  provider        = google-beta
  site_id         = "c"
  custom_domain   = "c.example.com"
  cert_preference = "GROUPED"
}
