resource "google_firebase_hosting_version" "compliant_headers_security" {
  provider = google-beta
  site_id  = "headers-security-site"

  config {
    headers {
      glob = "/**"
      headers = {
        # Common security headers (good defaults)
        "Content-Security-Policy" = "default-src 'self'"
        "X-Content-Type-Options"  = "nosniff"
        "X-Frame-Options"         = "DENY"
        "Referrer-Policy"         = "no-referrer"
        "Strict-Transport-Security" = "max-age=31536000; includeSubDomains; preload"
      }
    }
  }
}
