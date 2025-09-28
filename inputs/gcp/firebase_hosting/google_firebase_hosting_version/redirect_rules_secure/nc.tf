resource "google_firebase_hosting_version" "nc" {
  provider = google-beta
  site_id  = "nc"

  config {
    redirects {
      glob        = "/old/*"
      location    = "http://example.com/new"
      status_code = 302
    }
  }
}
