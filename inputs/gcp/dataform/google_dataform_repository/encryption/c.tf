# Google Dataform Repository — compliant encryption (CMEK required)

resource "google_dataform_repository" "c" {
  provider       = google-beta
  project        = var.project
  region         = "australia-southeast1"
  name           = "cmek-compliant"
  display_name   = "c"
  kms_key_name   = "projects/EXAMPLE/locations/australia-southeast1/keyRings/kr/cryptoKeys/key"
}
