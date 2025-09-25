resource "google_firebase_hosting_custom_domain" "non_compliant_custom_domain" {
  provider        = google-beta
  site_id         = "custom-domain-verification-site"
  custom_domain   = "example.com"
  cert_preference = ""                                  
}
