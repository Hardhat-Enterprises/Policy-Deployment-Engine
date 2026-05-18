# Healthcare FHIR Store - version (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "c" {
  name     = "example-dataset"
  location = "us-central1"
}

resource "google_healthcare_fhir_store" "c" {
  dataset = google_healthcare_dataset.c.id
  name    = "c"

  # COMPLIANT: R4 is the current stable FHIR version — approved for production use
  version = "R4"
}
