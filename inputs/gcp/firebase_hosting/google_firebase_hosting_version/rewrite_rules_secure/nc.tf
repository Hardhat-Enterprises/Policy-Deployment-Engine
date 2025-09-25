resource "google_firebase_hosting_version" "non_compliant_redirect_rules_secure" {
  provider = google-beta
  site_id  = "redirect-rules-secure-noncompliant-site"

  config {
    redirects {
      glob        = "/admin/**"
      location    = "/index.html"
      status_code = 200
    }
  }
}
