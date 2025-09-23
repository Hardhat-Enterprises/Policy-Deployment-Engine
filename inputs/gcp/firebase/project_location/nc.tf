# Non-compliant Firebase project without location set
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_firebase_project" "nc" {
  project_id     = "example-project-nc"
  project_number = "123456789013" # Mock project number
}