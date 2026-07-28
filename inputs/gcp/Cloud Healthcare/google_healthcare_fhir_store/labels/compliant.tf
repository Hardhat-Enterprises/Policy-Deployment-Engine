# Healthcare FHIR Store - labels (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_fhir_store" "compliant_example_1" {
  dataset = "my-project/us-central1/example-dataset"
  name    = "compliant_example_1"
  version = "R4"

  # COMPLIANT: all required labels present with approved values
  labels = {
    environment = "prod"
    owner       = "healthcare-team"
  }
}
