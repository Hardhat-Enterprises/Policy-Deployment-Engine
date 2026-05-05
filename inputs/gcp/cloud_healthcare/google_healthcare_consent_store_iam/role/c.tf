# Healthcare Consent Store IAM - role (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "c" {
  name     = "example-dataset"
  location = "us-central1"
}

resource "google_healthcare_consent_store" "c" {
  dataset = google_healthcare_dataset.c.id
  name    = "c"
}

resource "google_healthcare_consent_store_iam_member" "c" {
  dataset          = google_healthcare_dataset.c.id
  consent_store_id = google_healthcare_consent_store.c.name
  member           = "serviceAccount:healthcare-sa@my-project.iam.gserviceaccount.com"

  # COMPLIANT: specific healthcare role — not a primitive role
  role = "roles/healthcare.consentStoreViewer"
}
