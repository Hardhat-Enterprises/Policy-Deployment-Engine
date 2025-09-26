resource "google_firebase_hosting_version" "c" {
  provider = google-beta
  site_id  = "c"

  config {
    headers {
      glob = "**/*.js"
      headers = {
        Cache-Control = "max-age=31536000"
      }
    }
  }
}
