# Healthcare Consent Store — labels attribute (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "c" {
  name     = "compliant-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_consent_store" "c" {
  dataset                         = google_healthcare_dataset.c.id
  name                            = "compliant-consent-store"
  default_consent_ttl             = "31536000s"
  enable_consent_create_on_update = false

  # All 5 required labels present with approved values
  labels = {
    environment         = "prod"       # Valid: in {dev, test, staging, prod}
    owner               = "healthcare-team"
    data-classification = "phi"        # Valid: in {phi, restricted}
    cost-center         = "cc-001"
    compliance          = "hipaa"
  }
}
