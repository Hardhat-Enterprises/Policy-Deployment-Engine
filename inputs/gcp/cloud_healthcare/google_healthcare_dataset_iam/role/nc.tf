# Healthcare Dataset IAM - role (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "nc" {
  name     = "example-dataset"
  location = "us-central1"
}

resource "google_healthcare_dataset_iam_member" "nc" {
  dataset_id = google_healthcare_dataset.nc.name
  member     = "serviceAccount:healthcare-sa@my-project.iam.gserviceaccount.com"

  # VIOLATION: primitive role grants overly broad permissions across ALL stores in the dataset
  role = "roles/editor"
}
