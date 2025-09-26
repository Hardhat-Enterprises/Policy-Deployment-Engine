resource "google_firebase_hosting_version" "nc" {
  provider = google-beta
  site_id  = "nc"

  config {
    headers {
      glob = "/api/**"
      headers = {
        "Access-Control-Allow-Origin" = "*"
        # Optionally add this to ensure it fails on either check:
        # "Access-Control-Allow-Credentials" = "true"
      }
    }
  }
}
