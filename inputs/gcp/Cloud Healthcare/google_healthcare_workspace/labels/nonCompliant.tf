# Healthcare Workspace - labels (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_workspace" "non_compliant_example_1" {
  name    = "non_compliant_example_1"
  dataset = "my-project/us-central1/example-dataset"

  settings {
    data_project_ids = []
  }

  # VIOLATION: no labels defined
}
