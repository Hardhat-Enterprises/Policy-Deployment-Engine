# Healthcare Consent Store — effective_labels attribute (non-compliant)
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

  # VIOLATION: No labels block defined — effective_labels will be empty/null
}
