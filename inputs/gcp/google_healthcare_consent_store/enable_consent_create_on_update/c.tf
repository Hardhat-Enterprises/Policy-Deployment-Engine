# Healthcare Consent Store — enable_consent_create_on_update attribute (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "c" {
  name     = "compliant-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_consent_store" "c" {
  dataset             = google_healthcare_dataset.c.id
  name                = "compliant-consent-store"
  default_consent_ttl = "31536000s"

  # false — PATCH remains a pure update, preserving audit trail integrity
  enable_consent_create_on_update = false

  labels = {
    environment         = "prod"
    owner               = "healthcare-team"
    data-classification = "phi"
    cost-center         = "cc-001"
    compliance          = "hipaa"
  }
}
