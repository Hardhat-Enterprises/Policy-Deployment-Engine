resource "google_composer_environment" "nc" {
  name    = "nc"
  region  = "us-central1"
  project = "fake-project"

  config {
    encryption_config {
      kms_key_name = ""
    }
  }
}