# Healthcare FHIR Store - version (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "nc" {
  name     = "example-dataset"
  location = "us-central1"
}

resource "google_healthcare_fhir_store" "nc" {
  dataset = google_healthcare_dataset.nc.id
  name    = "nc"

  # VIOLATION: DSTU2 is a deprecated FHIR version — not approved for production use
  version = "DSTU2"
}
