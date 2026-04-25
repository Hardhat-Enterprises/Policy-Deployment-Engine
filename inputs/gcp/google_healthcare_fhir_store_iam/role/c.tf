# Healthcare FHIR Store IAM — role attribute (compliant)
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
  member        = "serviceAccount:healthcare-sa@my-project.iam.gserviceaccount.com"

  # COMPLIANT: specific FHIR store role — not a primitive role
  role = "roles/healthcare.fhirStoreViewer"
}
