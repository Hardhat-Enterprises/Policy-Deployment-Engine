resource "google_transcoder_job" "c" {
  location    = "us-central1"
  template_id = "preset/web-hd"
}