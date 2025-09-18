resource "google_firebase_hosting_version" "non_compliant_cors_policy_secure" {
  provider = google-beta
  site_id  = "cors-policy-secure-noncompliant-site"
  config {}
}