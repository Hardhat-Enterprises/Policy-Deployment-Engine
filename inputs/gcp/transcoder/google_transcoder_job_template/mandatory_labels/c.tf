resource "google_transcoder_job_template" "c" {
  job_template_id = "example-job-template-c"
  location        = "us-central1"

  labels = {
    environment = "dev"
  }
}