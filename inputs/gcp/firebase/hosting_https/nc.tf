# Non-compliant Firebase Hosting site allowing HTTP
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant


resource "google_firebase_hosting_site" "nc" {
  site_id = "insecure-hosting-site"
  project = "mock-project"
}