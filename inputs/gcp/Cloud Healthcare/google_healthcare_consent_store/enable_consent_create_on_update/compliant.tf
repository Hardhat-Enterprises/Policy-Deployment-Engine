# Healthcare Consent Store - enable_consent_create_on_update (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_consent_store" "compliant_example_1" {
  dataset = "my-project/us-central1/example-dataset"
  name    = "compliant_example_1"

  # COMPLIANT: false — PATCH remains a pure update, preserving audit trail
  enable_consent_create_on_update = false
}
