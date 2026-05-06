# Healthcare Dataset IAM - member (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant
# Note: This resource is in beta - uses provider = google-beta as per Provider Versions guide

resource "google_healthcare_dataset_iam_member" "nc" {
  provider   = google-beta
  dataset_id = "your-dataset-id"
  role       = "roles/healthcare.datasetViewer"

  # VIOLATION: allAuthenticatedUsers grants access to any Google-authenticated user
  member = "allAuthenticatedUsers"
}
