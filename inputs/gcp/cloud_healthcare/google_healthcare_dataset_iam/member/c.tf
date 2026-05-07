# Healthcare Dataset IAM - member (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset_iam_member" "c" {
  provider   = google-beta
  dataset_id = "c"
  role       = "roles/healthcare.datasetViewer"

  # COMPLIANT: specific service account — not a public or overly broad identity
  member = "serviceAccount:healthcare-sa@my-project.iam.gserviceaccount.com"
}
