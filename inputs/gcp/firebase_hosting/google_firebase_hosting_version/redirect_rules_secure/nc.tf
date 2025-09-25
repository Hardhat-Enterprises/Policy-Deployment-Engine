resource "google_firebase_hosting_version" "https_redirect_nc" {
  provider = google-beta
  site_id  = "nc"

  config {
    redirects {
      glob     = "/old/*"
      location = "http://example.com/new"
      status   = 302
    }
  }
}
