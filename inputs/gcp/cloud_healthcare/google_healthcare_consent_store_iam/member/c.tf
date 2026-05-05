# Healthcare Consent Store IAM — member attribute (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "c" {
  name     = "compliant-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_consent_store" "c" {
  dataset = google_healthcare_dataset.c.id
  name    = "compliant-consent-store"
}

resource "google_healthcare_consent_store_iam_member" "c" {
  dataset          = google_healthcare_dataset.c.id
  consent_store_id = google_healthcare_consent_store.c.name
  role             = "roles/healthcare.consentStoreViewer"

  # COMPLIANT: specific service account — not allUsers or allAuthenticatedUsers
  member = "serviceAccount:healthcare-sa@my-project.iam.gserviceaccount.com"
}
