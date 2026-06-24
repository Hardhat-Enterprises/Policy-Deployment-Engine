# Healthcare Consent Store - enable_consent_create_on_update (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "nc" {
  name     = "example-dataset"
  location = "us-central1"
}

resource "google_healthcare_consent_store" "nc" {
  dataset = google_healthcare_dataset.nc.id
  name    = "nc"

  # VIOLATION: true — PATCH becomes upsert, breaks create/update audit trail
  enable_consent_create_on_update = true
}