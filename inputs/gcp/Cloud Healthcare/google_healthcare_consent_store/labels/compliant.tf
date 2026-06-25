# Healthcare Consent Store - labels (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_consent_store" "compliant_example_1" {
  dataset = "my-project/us-central1/example-dataset"
  name    = "compliant_example_1"

  # COMPLIANT: all required labels with approved values
  labels = {
    environment = "prod"
    owner       = "healthcare-team"
  }
}
