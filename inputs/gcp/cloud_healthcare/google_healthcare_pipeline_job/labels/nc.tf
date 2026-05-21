# Healthcare Pipeline Job - labels (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "nc" {
  name     = "example-dataset"
  location = "us-central1"
}

resource "google_healthcare_pipeline_job" "nc" {
  name     = "nc"
  dataset  = google_healthcare_dataset.nc.id
  location = "us-central1"

  # VIOLATION: no labels defined
}
