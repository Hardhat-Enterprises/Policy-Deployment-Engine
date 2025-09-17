# Compliant Firebase Hosting site enforcing HTTPS
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "null_resource" "c" {
  triggers = {
    name        = "secure-hosting-site"
    require_ssl = true
    type        = "google_firebase_hosting_site"
  }
}


