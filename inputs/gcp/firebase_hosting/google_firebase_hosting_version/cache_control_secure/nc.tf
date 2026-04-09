resource "google_firebase_hosting_version" "nc" {
  provider = google-beta
  site_id  = "nc"

  config {
    headers {
      glob = "**/*.js"
      headers = {
        Cache-Control = "max-age=0"
      }
    }
  }
}
