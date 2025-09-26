resource "google_firebase_hosting_version" "c" {
  provider = google-beta
  site_id  = "c"

  config {
    headers {
      glob = "/api/**"
      headers = {
        "Access-Control-Allow-Origin"      = "https://example.com"
        "Access-Control-Allow-Credentials" = "false"
        "Access-Control-Allow-Methods"     = "GET, POST"
        "Access-Control-Allow-Headers"     = "Content-Type, Authorization"
      }
    }
  }
}
