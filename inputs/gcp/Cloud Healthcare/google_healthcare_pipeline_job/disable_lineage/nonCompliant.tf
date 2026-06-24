# Healthcare Pipeline Job - disable_lineage (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "nc" {
  name     = "example-dataset"
  location = "us-central1"
}

resource "google_healthcare_pipeline_job" "nc" {
  name     = "nc"
  dataset  = google_healthcare_dataset.nc.id
  location = "us-central1"

  # VIOLATION: true — lineage tracking disabled, data provenance cannot be audited
  disable_lineage = true
}
