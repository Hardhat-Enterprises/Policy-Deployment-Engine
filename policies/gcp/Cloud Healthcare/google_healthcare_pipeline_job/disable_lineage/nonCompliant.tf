# Healthcare Pipeline Job - disable_lineage (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_pipeline_job" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  dataset  = "my-project/us-central1/example-dataset"
  location = "us-central1"

  # VIOLATION: true — lineage tracking disabled, data provenance cannot be audited
  disable_lineage = true
}
