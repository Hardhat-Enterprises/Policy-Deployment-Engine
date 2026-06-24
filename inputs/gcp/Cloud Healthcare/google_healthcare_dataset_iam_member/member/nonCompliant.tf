# Healthcare Dataset IAM - member (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset_iam_member" "non_compliant_example_1" {
  provider   = google-beta
  dataset_id = "non_compliant_example_1"
  role       = "roles/healthcare.datasetViewer"

  # VIOLATION: allAuthenticatedUsers grants access to any Google-authenticated user
  member = "allAuthenticatedUsers"
}
