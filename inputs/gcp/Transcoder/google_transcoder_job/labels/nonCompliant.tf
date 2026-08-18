resource "google_transcoder_job" "non_compliant_example_1" {
  location = "us-central1"
  project  = "my-project-name"

  labels = {
    owner = "student"
  }
}
