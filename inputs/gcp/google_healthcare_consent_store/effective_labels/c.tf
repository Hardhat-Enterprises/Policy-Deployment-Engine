# Healthcare Consent Store — effective_labels attribute (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant
# effective_labels is a computed attribute that merges user labels with provider default_labels

resource "google_healthcare_dataset" "c" {
  name     = "compliant-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_consent_store" "c" {
  dataset                         = google_healthcare_dataset.c.id
  name                            = "compliant-consent-store"
  default_consent_ttl             = "31536000s"
  enable_consent_create_on_update = false

  # All required labels set — effective_labels will include these
  # plus any provider-level default_labels
  labels = {
    environment         = "prod"
    owner               = "healthcare-team"
    data-classification = "phi"
    cost-center         = "cc-001"
    compliance          = "hipaa"
  }
}
