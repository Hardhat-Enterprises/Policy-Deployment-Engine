resource "google_firebase_hosting_version" "c" {
  provider = google-beta
  site_id  = "c"

  config {
    headers {
      glob = "/**"
      headers = {
        "Content-Security-Policy" = "default-src 'self'"
        "X-Content-Type-Options"  = "nosniff"
        "X-Frame-Options"         = "DENY"
      }
    }
  }
}
