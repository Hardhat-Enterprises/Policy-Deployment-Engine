# Healthcare Consent Store - labels (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_consent_store" "non_compliant_example_1" {
  dataset = "my-project/us-central1/example-dataset"
  name    = "non_compliant_example_1"

  # VIOLATION: no labels defined
}
