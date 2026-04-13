resource "google_composer_environment" "c" {
  name    = "c"
  region  = "us-central1"
  project = "fake-project"

  config {
    encryption_config {
      kms_key_name = "projects/my-project/locations/us-central1/keyRings/my-kr/cryptoKeys/my-key"
    }
  }
}