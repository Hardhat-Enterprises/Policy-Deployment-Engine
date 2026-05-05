# Healthcare Consent Store — default_consent_ttl attribute (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "nc" {
  name     = "nc-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_consent_store" "nc" {
  dataset = google_healthcare_dataset.nc.id
  name    = "nc-consent-store"

  # VIOLATION: 86400s = 1 day — below the required minimum of 31536000s (1 year)
  default_consent_ttl = "86400s"

  enable_consent_create_on_update = false

  labels = {
    environment         = "prod"
    owner               = "healthcare-team"
    data-classification = "phi"
    cost-center         = "cc-001"
    compliance          = "hipaa"
  }
}
