# Compliant Firebase project with location set
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "null_resource" "c" {
  triggers = {
    resource_type = "google_firebase_project"
    project       = "example-project"
    location_id   = "us-central"  # Compliant region
    name          = "compliant-project"
  }
}