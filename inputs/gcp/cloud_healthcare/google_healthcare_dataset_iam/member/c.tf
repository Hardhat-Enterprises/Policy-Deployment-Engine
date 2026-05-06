# Healthcare Dataset IAM - member (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant
# Note: This resource is in beta - uses provider = google-beta as per Provider Versions guide

resource "google_healthcare_dataset_iam_member" "c" {
  provider   = google-beta
  dataset_id = "your-dataset-id"
  role       = "roles/healthcare.datasetViewer"

  # COMPLIANT: specific service account — not a public or overly broad identity
  member = "serviceAccount:healthcare-sa@my-project.iam.gserviceaccount.com"
}
