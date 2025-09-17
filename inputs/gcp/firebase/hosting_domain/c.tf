# Compliant Firebase Hosting site using an approved domain
# Keep "c" as the name to indicate that this resource and its attributes are compliant


resource "null_resource" "c" {
  triggers = {
    name        = "approved-site"
    default_url = "example.com"
    type        = "google_firebase_hosting_site"
  }
}