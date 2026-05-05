# Healthcare FHIR Store IAM — member attribute (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "c" {
  name     = "compliant-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_fhir_store" "c" {
  dataset = google_healthcare_dataset.c.id
  name    = "compliant-fhir-store"
  version = "R4"
}

resource "google_healthcare_fhir_store_iam_member" "c" {
  dataset       = google_healthcare_dataset.c.id
  fhir_store_id = google_healthcare_fhir_store.c.name
  role          = "roles/healthcare.fhirStoreViewer"

  # COMPLIANT: specific service account — not allUsers, allAuthenticatedUsers, or projectOwner/Editor/Viewer
  member = "serviceAccount:healthcare-sa@my-project.iam.gserviceaccount.com"
}
