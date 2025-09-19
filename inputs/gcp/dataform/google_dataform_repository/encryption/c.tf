# Google Dataform Repository — compliant (encryption: CMEK required)

resource "google_dataform_repository" "c" {
  provider       = google-beta
  project        = var.project
  region         = "australia-southeast1"
  name           = "dataform-repo-compliant-encryption"
  display_name   = "dataform-repository-compliant-encryption"
  kms_key_name   = "projects/my-project/locations/australia-southeast1/keyRings/dataform-kr/cryptoKeys/dataform-key"
}

