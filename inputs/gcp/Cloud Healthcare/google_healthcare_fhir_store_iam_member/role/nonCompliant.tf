# Healthcare FHIR Store IAM - role (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_fhir_store_iam_member" "non_compliant_example_1" {
  fhir_store_id = "non_compliant_example_1"
  member        = "serviceAccount:healthcare-sa@my-project.iam.gserviceaccount.com"

  # VIOLATION: primitive role grants overly broad permissions — violates least privilege for FHIR data
  role = "roles/owner"
}
