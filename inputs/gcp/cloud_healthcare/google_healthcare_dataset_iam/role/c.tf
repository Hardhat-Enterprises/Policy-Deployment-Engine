# Healthcare Dataset IAM - role (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant
# Note: Beta resource — uses google-beta provider per Provider Versions guide

resource "google_healthcare_dataset_iam_member" "c" {
  provider   = google-beta
  dataset_id = "my-project/us-central1/example-dataset"
  member     = "serviceAccount:healthcare-sa@my-project.iam.gserviceaccount.com"

  # COMPLIANT: specific healthcare dataset role — not a primitive role
  role = "roles/healthcare.datasetViewer"
}
