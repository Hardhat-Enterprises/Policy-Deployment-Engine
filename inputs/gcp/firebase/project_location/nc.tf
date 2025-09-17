# Non-compliant Firebase project without location set
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "null_resource" "nc" {
  triggers = {
    resource_type = "google_firebase_project"
    project       = "example-project-nc"
    location_id   = "asia-south1"  # Disallowed region
    name          = "non-compliant-project"
  }
}