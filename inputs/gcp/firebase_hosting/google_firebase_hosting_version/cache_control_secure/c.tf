resource "google_firebase_hosting_version" "compliant_cache_control" {
  provider = google-beta
  site_id  = "cache-control-compliant-site"

  config {}
}