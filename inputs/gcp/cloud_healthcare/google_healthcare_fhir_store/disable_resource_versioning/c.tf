# Healthcare FHIR Store — disable_resource_versioning attribute (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "c" {
  name     = "compliant-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_fhir_store" "c" {
  dataset  = google_healthcare_dataset.c.id
  name     = "compliant-fhir-store"
  version  = "R4"

  # COMPLIANT: false — resource versioning enabled, full history of FHIR
  # resource changes is retained for audit trail and HIPAA compliance
  disable_resource_versioning = false

  labels = {
    environment         = "prod"
    owner               = "healthcare-team"
    data-classification = "phi"
    cost-center         = "cc-001"
    compliance          = "hipaa"
  }
}
