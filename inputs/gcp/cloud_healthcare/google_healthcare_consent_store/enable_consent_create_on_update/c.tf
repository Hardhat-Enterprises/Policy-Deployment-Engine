# Healthcare Consent Store - enable_consent_create_on_update (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "c" {
  name     = "example-dataset"
  location = "us-central1"
}

resource "google_healthcare_consent_store" "c" {
  dataset = google_healthcare_dataset.c.id
  name    = "c"

  # COMPLIANT: false — PATCH remains a pure update, preserving audit trail
  enable_consent_create_on_update = false
}