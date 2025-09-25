resource "google_firebase_hosting_version" "https_redirect_c" {
  provider = google-beta
  site_id  = "c"

  config {
    redirects {
      glob     = "/old/*"
      location = "https://example.com/new"
      status   = 301
    }
  }
}
