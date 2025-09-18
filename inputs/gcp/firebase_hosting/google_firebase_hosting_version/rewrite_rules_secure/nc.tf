resource "google_firebase_hosting_version" "non_compliant_rewrite_rules_secure" {
  provider = google-beta
  site_id  = "rewrite-rules-secure-noncompliant-site"

  config {
    # Sensitive route (blacklisted)
    rewrites {
      glob = "/admin/**"
      path = "/index.html"
    }
  }
}
