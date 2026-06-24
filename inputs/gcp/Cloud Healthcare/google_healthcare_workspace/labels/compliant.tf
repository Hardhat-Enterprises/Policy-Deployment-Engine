# Healthcare Workspace - labels (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "c" {
  name     = "example-dataset"
  location = "us-central1"
}

resource "google_healthcare_workspace" "c" {
  name    = "c"
  dataset = google_healthcare_dataset.c.id

  settings {
    data_project_ids = []
  }

  # COMPLIANT: all required labels present with approved values
  labels = {
    environment = "prod"
    owner       = "healthcare-team"
  }
}
