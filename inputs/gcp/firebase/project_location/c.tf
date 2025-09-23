# Compliant Firebase project with location set
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_firebase_project" "c" {
  project_id     = "example-project"
  project_number = "123456789012" # Mock project number
}