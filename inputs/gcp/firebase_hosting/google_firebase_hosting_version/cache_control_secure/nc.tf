resource "google_firebase_hosting_version" "non_compliant_cache_control" {
  provider = google-beta
  site_id  = "nc"

  config {
    # BAD for sensitive route: caches login pages for a year
    headers {
      glob = "/login*"
      headers = {
        Cache-Control = "public, max-age=31536000"
      }
    }

    # BAD for static assets: too short, not in allowed list
    headers {
      glob = "**/*.js"
      headers = {
        Cache-Control = "max-age=0"
      }
    }
  }
}
