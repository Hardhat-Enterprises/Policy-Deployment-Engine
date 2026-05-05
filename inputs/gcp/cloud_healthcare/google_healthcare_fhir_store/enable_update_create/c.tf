# Healthcare FHIR Store — enable_update_create attribute (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "c" {
  name     = "compliant-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_fhir_store" "c" {
  dataset  = google_healthcare_dataset.c.id
  name     = "compliant-fhir-store"
  version  = "R4"

  # COMPLIANT: false — PUT requests cannot create new resources,
  # preserving the distinct create/update audit trail
  enable_update_create = false

  labels = {
    environment         = "prod"
    owner               = "healthcare-team"
    data-classification = "phi"
    cost-center         = "cc-001"
    compliance          = "hipaa"
  }
}
