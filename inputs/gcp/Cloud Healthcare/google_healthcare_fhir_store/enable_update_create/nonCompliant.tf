# Healthcare FHIR Store - enable_update_create (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_fhir_store" "non_compliant_example_1" {
  dataset = "my-project/us-central1/example-dataset"
  name    = "non_compliant_example_1"
  version = "R4"

  # VIOLATION: true — allows client-specified IDs which may contain sensitive patient identifiers
  enable_update_create = true
}
