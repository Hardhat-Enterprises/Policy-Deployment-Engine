# Healthcare FHIR Store IAM - member (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_fhir_store_iam_member" "nc" {
  provider      = google-beta
  fhir_store_id = "nc"
  role          = "roles/healthcare.fhirResourceViewer"

  # VIOLATION: allUsers grants public unauthenticated access to FHIR patient data
  member = "allUsers"
}
