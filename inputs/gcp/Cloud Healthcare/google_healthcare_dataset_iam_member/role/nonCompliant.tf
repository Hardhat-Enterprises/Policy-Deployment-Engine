# Healthcare Dataset IAM - role (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset_iam_member" "non_compliant_example_1" {
  dataset_id = "non_compliant_example_1"
  member     = "serviceAccount:healthcare-sa@my-project.iam.gserviceaccount.com"

  # VIOLATION: primitive role grants overly broad permissions across ALL stores in the dataset
  role = "roles/editor"
}
