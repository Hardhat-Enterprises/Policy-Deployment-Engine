# Healthcare Consent Store IAM - member (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_consent_store_iam_member" "compliant_example_1" {
  dataset          = "my-project/us-central1/example-dataset"
  consent_store_id = "compliant_example_1"
  role             = "roles/healthcare.consentStoreViewer"

  # COMPLIANT: specific service account — not a public or overly broad identity
  member = "serviceAccount:healthcare-sa@my-project.iam.gserviceaccount.com"
}
