resource "google_firebase_hosting_version" "non_compliant_cache_control" {
  provider = google-beta
  site_id  = "cache-control-non-compliant-site"

  config {}
}