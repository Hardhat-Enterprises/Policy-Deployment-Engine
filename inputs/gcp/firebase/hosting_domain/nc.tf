# Non-compliant Firebase Hosting site using a non-approved domain
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant


resource "null_resource" "nc" {
  triggers = {
    name        = "unapproved-site"
    default_url = "malicious.com"
    type        = "google_firebase_hosting_site"
  }
}
