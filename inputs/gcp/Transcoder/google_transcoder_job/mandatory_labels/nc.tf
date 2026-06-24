resource "google_transcoder_job" "nc" {
  location = "us-central1"
  project  = "my-project-name"

  labels = {
    owner = "student"
  }
}