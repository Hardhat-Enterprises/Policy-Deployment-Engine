# Healthcare FHIR Store IAM - member (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_fhir_store_iam_member" "compliant_example_1" {
  provider      = google-beta
  fhir_store_id = "compliant_example_1"
  role          = "roles/healthcare.fhirResourceViewer"

  # COMPLIANT: specific service account — not a public or overly broad identity
  member = "serviceAccount:healthcare-sa@my-project.iam.gserviceaccount.com"
}
