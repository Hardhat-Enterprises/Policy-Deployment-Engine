# Healthcare Consent Store IAM - member (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_consent_store_iam_member" "non_compliant_example_1" {
  dataset          = "my-project/us-central1/example-dataset"
  consent_store_id = "non_compliant_example_1"
  role             = "roles/healthcare.consentStoreViewer"

  # VIOLATION: allUsers grants public unauthenticated access to PHI consent data
  member = "allUsers"
}
