resource "google_firebase_hosting_version" "compliant_redirect_rules_secure" {
  provider = google-beta
  site_id  = "redirect-rules-secure-compliant-site"
  config {
    redirects {
      glob        = "/old/**"
      location    = "/new/index.html"
      status_code = 301
    }
  }
}
