# Non-compliant firebase web app configuration
# This is for demonstrating a non-compliant case for the allowed-domains policy.
# Keep "nc" as the name to indicate non-compliant attributes

resource "google_firebase_web_app" "nc" {
  provider      = google-beta
  display_name  = "Firebase Web App NC"
  project       = "reas-bd5ca"
}

data "google_firebase_web_app_config" "nc" {
  provider   = google-beta
  project    = google_firebase_web_app.nc.project
  web_app_id = google_firebase_web_app.nc.app_id
}

output "firebase_auth_domain_nc" {
  value = data.google_firebase_web_app_config.nc.auth_domain
}