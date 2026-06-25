# Healthcare FHIR Store IAM - member (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_fhir_store_iam_member" "non_compliant_example_1" {
  fhir_store_id = "non_compliant_example_1"
  role          = "roles/healthcare.fhirResourceViewer"

  # VIOLATION: allUsers grants public unauthenticated access to FHIR patient data
  member = "allUsers"
}
