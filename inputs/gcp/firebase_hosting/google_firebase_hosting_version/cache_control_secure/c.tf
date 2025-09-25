resource "google_firebase_hosting_version" "compliant_cache_control" {
  provider = google-beta
  site_id  = "c"

  config {
    headers {
      glob = "/login*"
      headers = {
        Cache-Control = "no-cache"
      }
    }

    headers {
      glob = "**/*.js"
      headers = {
        Cache-Control = "max-age=31536000"
      }
    }
  }
}

