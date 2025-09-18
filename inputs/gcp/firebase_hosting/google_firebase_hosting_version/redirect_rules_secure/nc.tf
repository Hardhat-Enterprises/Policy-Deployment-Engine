resource "google_firebase_hosting_version" "non_compliant_redirect_rules_secure" {
  provider = google-beta
  site_id  = "redirect-rules-secure-noncompliant-site"

  config {
    redirects {
      glob        = "/old-path/**"
      status_code = 302
      location    = "http://insecure.example.com/new-path"
    }
  }
}
