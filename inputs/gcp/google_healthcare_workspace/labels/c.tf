# Healthcare Workspace — labels attribute (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant
# The workspace holds all Data Mapper IDE mappings and controls access to mapping configuration

resource "google_healthcare_dataset" "c" {
  name     = "compliant-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_workspace" "c" {
  name    = "compliant-workspace"
  dataset = google_healthcare_dataset.c.id

  # COMPLIANT: all required labels present with approved values
  labels = {
    environment         = "prod"
    owner               = "healthcare-team"
    data-classification = "phi"
    cost-center         = "cc-001"
    compliance          = "hipaa"
  }
}
