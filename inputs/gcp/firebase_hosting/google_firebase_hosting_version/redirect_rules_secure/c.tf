resource "google_firebase_hosting_version" "c" {
  provider = google-beta
  site_id  = "c"

  config {
    redirects {
      glob        = "/old/*"
      location    = "https://example.com/new"
      status_code = 301
    }
  }
}
