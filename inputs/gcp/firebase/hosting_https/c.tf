# Compliant Firebase Hosting site enforcing HTTPS
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_firebase_hosting_site" "c" {
  site_id = "secure-hosting-site"
  project = "mock-project"
}


