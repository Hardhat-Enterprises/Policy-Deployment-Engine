resource "google_transcoder_job_template" "non_compliant_example_1" {
  job_template_id = "example-job-template-nc"
  location        = "us-central1"

  labels = {
    owner = "student"
  }
}
