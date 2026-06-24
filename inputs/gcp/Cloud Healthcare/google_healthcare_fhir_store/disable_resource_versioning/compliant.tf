# Healthcare FHIR Store - disable_resource_versioning (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "c" {
  name     = "example-dataset"
  location = "us-central1"
}

resource "google_healthcare_fhir_store" "c" {
  dataset = google_healthcare_dataset.c.id
  name    = "c"
  version = "R4"

  # COMPLIANT: false — resource versioning enabled, historical versions retained for audit
  disable_resource_versioning = false
}
