resource "google_firebase_hosting_version" "nc" {
  provider = google-beta
  site_id  = "nc"

  config {
    headers {
      glob    = "/api/**"
      headers = {
        "Access-Control-Allow-Origin"      = "*"
        "Access-Control-Allow-Credentials" = "true"
      }
    }
  }
}
