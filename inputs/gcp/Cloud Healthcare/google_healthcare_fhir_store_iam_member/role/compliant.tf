# Healthcare FHIR Store IAM - role (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_fhir_store_iam_member" "compliant_example_1" {
  fhir_store_id = "compliant_example_1"
  member        = "serviceAccount:healthcare-sa@my-project.iam.gserviceaccount.com"

  # COMPLIANT: specific FHIR store role — not a primitive role
  role = "roles/healthcare.fhirResourceViewer"
}
