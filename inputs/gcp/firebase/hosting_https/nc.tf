# Non-compliant Firebase Hosting site allowing HTTP
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant


resource "null_resource" "nc" {
  triggers = {
    name        = "insecure-hosting-site"
    require_ssl = false
    type        = "google_firebase_hosting_site"
  }
}