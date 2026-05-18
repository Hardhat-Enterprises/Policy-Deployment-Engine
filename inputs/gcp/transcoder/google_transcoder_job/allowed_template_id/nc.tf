resource "google_transcoder_job" "nc" {
  location    = "us-central1"
  template_id = "unapproved-template"
}