resource "google_firebase_hosting_version" "compliant_cors_policy_secure" {
  provider = google-beta
  site_id  = "cors-policy-secure-compliant-site"
  config {}
}
