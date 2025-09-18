resource "google_firebase_hosting_version" "compliant_redirect_rules_secure" {
  provider = google-beta
  site_id  = "redirect-rules-secure-compliant-site"

  config {
    redirects {
      glob        = "/old-path/**"
      status_code = 301
      location    = "https://example.com/new-path"
    }
  }
}
