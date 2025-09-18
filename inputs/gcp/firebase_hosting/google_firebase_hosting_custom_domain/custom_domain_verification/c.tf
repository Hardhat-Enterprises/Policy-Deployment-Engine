resource "google_firebase_hosting_custom_domain" "compliant_custom_domain" {
  provider        = google-beta
  site_id         = var.site_id
  custom_domain   = var.custom_domain
  cert_preference = "GROUPED"
}
