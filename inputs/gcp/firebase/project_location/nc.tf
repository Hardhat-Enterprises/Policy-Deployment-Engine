# Non-compliant Firebase project without location set
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_firebase_project" "nc" {
  project = "example-project"
}
