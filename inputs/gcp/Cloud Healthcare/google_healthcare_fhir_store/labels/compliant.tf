# Healthcare FHIR Store - labels (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "c" {
  name     = "example-dataset"
  location = "us-central1"
}

resource "google_healthcare_fhir_store" "c" {
  dataset = google_healthcare_dataset.c.id
  name    = "c"
  version = "R4"

  # COMPLIANT: all required labels present with approved values
  labels = {
    environment = "prod"
    owner       = "healthcare-team"
  }
}
