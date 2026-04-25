# Healthcare FHIR Store — enable_update_create attribute (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "nc" {
  name     = "nc-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_fhir_store" "nc" {
  dataset  = google_healthcare_dataset.nc.id
  name     = "nc-fhir-store"
  version  = "R4"

  # VIOLATION: true — allows PUT requests to create new FHIR resources,
  # breaking the audit trail distinction between create and update operations
  enable_update_create = true

  labels = {
    environment         = "prod"
    owner               = "healthcare-team"
    data-classification = "phi"
    cost-center         = "cc-001"
    compliance          = "hipaa"
  }
}
