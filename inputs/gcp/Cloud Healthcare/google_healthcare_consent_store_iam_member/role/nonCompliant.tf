# Healthcare Consent Store IAM - role (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_consent_store_iam_member" "non_compliant_example_1" {
  dataset          = "my-project/us-central1/example-dataset"
  consent_store_id = "non_compliant_example_1"
  member           = "serviceAccount:healthcare-sa@my-project.iam.gserviceaccount.com"

  # VIOLATION: primitive role grants overly broad permissions — violates least privilege
  role = "roles/owner"
}
