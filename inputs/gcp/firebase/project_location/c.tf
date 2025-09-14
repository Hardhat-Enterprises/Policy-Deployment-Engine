# Compliant Firebase project with location set
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_firebase_project" "c" {
  project     = "example-project"
  location_id = "us-central"
}
