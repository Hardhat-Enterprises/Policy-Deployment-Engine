# Non-compliant Firebase Hosting site using a non-approved domain
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant


resource "google_firebase_hosting_site" "nc" {
  site_id = "unapproved-site"
  project = "mock-project"
}
