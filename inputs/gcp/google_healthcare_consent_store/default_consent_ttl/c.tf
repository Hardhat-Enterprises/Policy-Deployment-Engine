# Healthcare Consent Store — default_consent_ttl attribute (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "c" {
  name     = "compliant-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_consent_store" "c" {
  dataset = google_healthcare_dataset.c.id
  name    = "compliant-consent-store"

  # 31536000s = 1 year — meets the minimum TTL requirement
  default_consent_ttl = "31536000s"

  enable_consent_create_on_update = false

  labels = {
    environment         = "prod"
    owner               = "healthcare-team"
    data-classification = "phi"
    cost-center         = "cc-001"
    compliance          = "hipaa"
  }
}
