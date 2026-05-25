# Healthcare Pipeline Job - disable_lineage (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "c" {
  name     = "example-dataset"
  location = "us-central1"
}

resource "google_healthcare_pipeline_job" "c" {
  name     = "c"
  dataset  = google_healthcare_dataset.c.id
  location = "us-central1"

  # COMPLIANT: false — lineage tracking enabled, data provenance maintained for audit
  disable_lineage = false
}
