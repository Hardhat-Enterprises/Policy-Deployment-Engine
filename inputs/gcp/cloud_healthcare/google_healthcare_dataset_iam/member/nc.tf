# Healthcare Dataset IAM — member attribute (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "nc" {
  name     = "nc-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_dataset_iam_member" "nc" {
  dataset_id = google_healthcare_dataset.nc.id
  role       = "roles/healthcare.datasetViewer"

  # VIOLATION: allAuthenticatedUsers grants access to any Google-authenticated user
  member = "allAuthenticatedUsers"
}
