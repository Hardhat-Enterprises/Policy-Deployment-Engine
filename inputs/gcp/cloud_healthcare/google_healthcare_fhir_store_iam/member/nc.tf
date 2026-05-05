# Healthcare FHIR Store IAM — member attribute (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "nc" {
  name     = "nc-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_fhir_store" "nc" {
  dataset = google_healthcare_dataset.nc.id
  name    = "nc-fhir-store"
  version = "R4"
}

resource "google_healthcare_fhir_store_iam_member" "nc" {
  dataset       = google_healthcare_dataset.nc.id
  fhir_store_id = google_healthcare_fhir_store.nc.name
  role          = "roles/healthcare.fhirStoreViewer"

  # VIOLATION: allAuthenticatedUsers grants FHIR PHI access to any Google account
  member = "allAuthenticatedUsers"
}
