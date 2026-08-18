# Healthcare FHIR Store - disable_resource_versioning (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_fhir_store" "compliant_example_1" {
  dataset = "my-project/us-central1/example-dataset"
  name    = "compliant_example_1"
  version = "R4"

  # COMPLIANT: false — resource versioning enabled, historical versions retained for audit
  disable_resource_versioning = false
}
