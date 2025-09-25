resource "google_firebase_hosting_version" "non_compliant_cors_policy_secure" {
  provider = google-beta
  site_id  = "nc"  # <- autotester-friendly

  config {
    headers {
      glob    = "/api/**"
      headers = {
        # Wildcard origin is the non-compliance we want caught
        "Access-Control-Allow-Origin"      = "*"
        # You can optionally make it “worse” to ensure it’s flagged:
        # "Access-Control-Allow-Credentials" = "true"
      }
    }
  }
}
