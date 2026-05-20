# Healthcare FHIR Store - disable_resource_versioning (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "nc" {
  name     = "example-dataset"
  location = "us-central1"
}

resource "google_healthcare_fhir_store" "nc" {
  dataset = google_healthcare_dataset.nc.id
  name    = "nc"
  version = "R4"

  # VIOLATION: true — versioning disabled, no historical versions kept, breaks audit trail
  disable_resource_versioning = true
}
