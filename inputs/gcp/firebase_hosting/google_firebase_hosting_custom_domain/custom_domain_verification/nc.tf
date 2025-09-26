resource "google_firebase_hosting_custom_domain" "nc" {
  provider        = google-beta
  site_id         = "nc"
  custom_domain   = "nc.example.com"
  cert_preference = ""  
}
