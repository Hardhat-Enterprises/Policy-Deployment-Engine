# Defines a session template that inherits insecure network and identity defaults.
resource "google_dataproc_session_template" "nc" {
  project  = "my-project-dataproc02" 
  location = "us-central1"
  name     = "session-template-non-compliant"

}