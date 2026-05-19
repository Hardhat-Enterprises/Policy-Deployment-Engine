resource "google_transcoder_job_template" "nc" {
  job_template_id = "example-job-template-nc"
  location        = "us-central1"
  project         = "forbidden-project"
}