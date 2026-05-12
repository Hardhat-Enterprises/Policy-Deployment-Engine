# Healthcare Consent Store IAM - member (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "nc" {
  name     = "example-dataset"
  location = "us-central1"
}

resource "google_healthcare_consent_store" "nc" {
  dataset = google_healthcare_dataset.nc.id
  name    = "nc"
}

resource "google_healthcare_consent_store_iam_member" "nc" {
  dataset          = google_healthcare_dataset.nc.id
  consent_store_id = google_healthcare_consent_store.nc.name
  role             = "roles/healthcare.consentStoreViewer"

  # VIOLATION: allUsers grants public unauthenticated access to PHI consent data
  member = "allUsers"
}
