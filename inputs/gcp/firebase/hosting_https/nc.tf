# Non-compliant Firebase Hosting site allowing HTTP
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_firebase_hosting_site" "nc" {
  name        = "insecure-hosting-site"
  require_ssl = false
}

