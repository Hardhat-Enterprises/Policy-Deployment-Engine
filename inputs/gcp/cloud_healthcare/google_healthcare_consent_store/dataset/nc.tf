# Healthcare Consent Store — dataset attribute (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "nc" {
  name     = "nc-dataset"
  location = "us-west1" # VIOLATION: us-west1 is not in approved locations

  # VIOLATION: No encryption_spec — no CMEK encryption
}

resource "google_healthcare_consent_store" "nc" {
  dataset                         = google_healthcare_dataset.nc.id
  name                            = "nc-consent-store"
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
