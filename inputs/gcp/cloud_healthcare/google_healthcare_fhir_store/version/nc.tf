# Healthcare FHIR Store — version attribute (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "nc" {
  name     = "nc-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_fhir_store" "nc" {
  dataset = google_healthcare_dataset.nc.id
  name    = "nc-fhir-store"

  # VIOLATION: DSTU2 is a legacy FHIR version with limited security capabilities
  # and is not recommended for new PHI workloads
  version = "DSTU2"

  labels = {
    environment         = "prod"
    owner               = "healthcare-team"
    data-classification = "phi"
    cost-center         = "cc-001"
    compliance          = "hipaa"
  }
}
