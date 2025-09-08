# Google Dataform Repository — compliant (encryption policy: kms_key_name is set)

resource "google_dataform_repository" "c" {
  provider       = google-beta
  project        = var.project
  region         = "us-central1"
  name           = "cmek-good"
  display_name   = "dataform-compliant-encryption"
  kms_key_name   = "projects/example/locations/us-central1/keyRings/kr/cryptoKeys/key"
}


