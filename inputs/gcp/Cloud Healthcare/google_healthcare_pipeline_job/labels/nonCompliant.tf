# Healthcare Pipeline Job - labels (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_pipeline_job" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  dataset  = "my-project/us-central1/example-dataset"
  location = "us-central1"

  # VIOLATION: no labels defined
}
