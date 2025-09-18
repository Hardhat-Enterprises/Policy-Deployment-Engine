resource "google_firebase_hosting_version" "compliant_rewrite_rules_secure" {
  provider = google-beta
  site_id  = "rewrite-rules-secure-compliant-site"

  config {
    # Example SPA-style rewrite to index.html
    rewrites {
      glob = "/app/**"
      path = "/index.html"
    }
  }
}
