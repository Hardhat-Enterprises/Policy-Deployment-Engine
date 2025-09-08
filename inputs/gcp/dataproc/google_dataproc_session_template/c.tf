# Defines a session template with a secure execution environment.
resource "google_dataproc_session_template" "c" {
  project  = "my-project-dataproc02" 
  location = "us-central1"
  name     = "session-template-compliant"

}