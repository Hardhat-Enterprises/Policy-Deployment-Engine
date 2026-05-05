# Healthcare FHIR Store — disable_resource_versioning attribute (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "nc" {
  name     = "nc-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_fhir_store" "nc" {
  dataset  = google_healthcare_dataset.nc.id
  name     = "nc-fhir-store"
  version  = "R4"

  # VIOLATION: true — disables versioning of FHIR resources, destroying the
  # audit trail and making it impossible to track changes to PHI over time
  disable_resource_versioning = true

  labels = {
    environment         = "prod"
    owner               = "healthcare-team"
    data-classification = "phi"
    cost-center         = "cc-001"
    compliance          = "hipaa"
  }
}
