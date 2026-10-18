# Healthcare FHIR Store - disable_resource_versioning (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_fhir_store" "non_compliant_example_1" {
  dataset = "my-project/us-central1/example-dataset"
  name    = "non_compliant_example_1"
  version = "R4"

  # VIOLATION: true — versioning disabled, no historical versions kept, breaks audit trail
  disable_resource_versioning = true
}
