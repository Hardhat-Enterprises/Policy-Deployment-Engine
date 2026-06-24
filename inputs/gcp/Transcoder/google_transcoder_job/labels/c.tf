resource "google_transcoder_job" "c" {
  location = "us-central1"
  project  = "my-project-name"

  labels = {
    environment = "dev"
  }
}