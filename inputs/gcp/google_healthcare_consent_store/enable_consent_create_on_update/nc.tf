# Healthcare Consent Store — enable_consent_create_on_update attribute (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "nc" {
  name     = "nc-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_consent_store" "nc" {
  dataset             = google_healthcare_dataset.nc.id
  name                = "nc-consent-store"
  default_consent_ttl = "31536000s"

  # VIOLATION: true — PATCH becomes upsert, breaks create/update audit trail
  enable_consent_create_on_update = true

  labels = {
    environment         = "prod"
    owner               = "healthcare-team"
    data-classification = "phi"
    cost-center         = "cc-001"
    compliance          = "hipaa"
  }
}
