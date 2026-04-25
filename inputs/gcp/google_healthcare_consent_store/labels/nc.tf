# Healthcare Consent Store — labels attribute (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "nc" {
  name     = "nc-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_consent_store" "nc" {
  dataset                         = google_healthcare_dataset.nc.id
  name                            = "nc-consent-store"
  default_consent_ttl             = "31536000s"
  enable_consent_create_on_update = false

  # VIOLATION: Missing required labels — owner, cost-center, compliance
  # VIOLATION: environment = "debug" — not in {dev, test, staging, prod}
  # VIOLATION: data-classification = "public" — not in {phi, restricted}
  labels = {
    environment         = "debug"
    data-classification = "public"
  }
}
