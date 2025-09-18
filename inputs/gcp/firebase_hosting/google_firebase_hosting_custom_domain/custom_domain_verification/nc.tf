resource "google_firebase_hosting_custom_domain" "non_compliant_custom_domain" {
  provider        = google-beta
  site_id         = var.site_id
  custom_domain   = var.custom_domain
  # Non-compliant: certificate preference left empty
  cert_preference = ""
}
