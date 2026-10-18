# Healthcare Pipeline Job - disable_lineage (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_pipeline_job" "compliant_example_1" {
  name     = "compliant_example_1"
  dataset  = "my-project/us-central1/example-dataset"
  location = "us-central1"

  # COMPLIANT: false — lineage tracking enabled, data provenance maintained for audit
  disable_lineage = false
}
