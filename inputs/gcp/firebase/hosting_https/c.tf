# Compliant Firebase Hosting site enforcing HTTPS
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_firebase_hosting_site" "c" {
  name        = "secure-hosting-site"
  require_ssl = true
}

