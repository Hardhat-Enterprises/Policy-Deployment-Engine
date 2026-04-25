# Healthcare Dataset IAM — member attribute (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "c" {
  name     = "compliant-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_dataset_iam_member" "c" {
  dataset_id = google_healthcare_dataset.c.id
  role       = "roles/healthcare.datasetViewer"

  # COMPLIANT: specific service account — not allUsers or allAuthenticatedUsers
  member = "serviceAccount:healthcare-sa@my-project.iam.gserviceaccount.com"
}
