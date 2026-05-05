# Healthcare Consent Store — dataset attribute (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "c" {
  name     = "compliant-dataset"
  location = "australia-southeast1"

  encryption_spec {
    kms_key_name = "projects/my-project/locations/australia-southeast1/keyRings/healthcare-kr/cryptoKeys/healthcare-key"
  }
}

resource "google_healthcare_consent_store" "c" {
  dataset                         = google_healthcare_dataset.c.id
  name                            = "compliant-consent-store"
  default_consent_ttl             = "31536000s"
  enable_consent_create_on_update = false

  labels = {
    environment         = "prod"
    owner               = "healthcare-team"
    data-classification = "phi"
    cost-center         = "cc-001"
    compliance          = "hipaa"
  }
}
