# Healthcare Consent Store IAM — role attribute (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "nc" {
  name     = "nc-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_consent_store" "nc" {
  dataset = google_healthcare_dataset.nc.id
  name    = "nc-consent-store"
}

resource "google_healthcare_consent_store_iam_member" "nc" {
  dataset          = google_healthcare_dataset.nc.id
  consent_store_id = google_healthcare_consent_store.nc.name
  member           = "serviceAccount:healthcare-sa@my-project.iam.gserviceaccount.com"

  # VIOLATION: primitive role grants overly broad permissions — violates least privilege
  role = "roles/owner"
}
