resource "google_firebase_hosting_version" "compliant_cors_policy_secure" {
  provider = google-beta
  site_id  = "c"  # <- autotester-friendly

  config {
    headers {
      glob = "/api/**"
      headers = {
        "Access-Control-Allow-Origin"      = "https://example.com"
        "Access-Control-Allow-Credentials" = "false"
        "Access-Control-Allow-Methods"     = "GET, POST"
        "Access-Control-Allow-Headers"     = "Content-Type, Authorization"
      }
    }
  }
}
