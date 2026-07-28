# Healthcare Workspace - labels (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_workspace" "compliant_example_1" {
  name    = "compliant_example_1"
  dataset = "my-project/us-central1/example-dataset"

  settings {
    data_project_ids = []
  }

  # COMPLIANT: all required labels present with approved values
  labels = {
    environment = "prod"
    owner       = "healthcare-team"
  }
}
