# Healthcare Dataset IAM - member (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset_iam_member" "nc" {
  provider   = google-beta
  dataset_id = "my-project/us-central1/example-dataset"
  role       = "roles/healthcare.datasetViewer"

  # VIOLATION: allAuthenticatedUsers grants access to any Google-authenticated user
  member = "allAuthenticatedUsers"
}
