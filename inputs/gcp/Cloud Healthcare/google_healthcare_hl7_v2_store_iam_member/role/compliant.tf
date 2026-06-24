# Healthcare HL7 V2 Store IAM - role (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_hl7_v2_store_iam_member" "compliant_example_1" {
  provider        = google-beta
  hl7_v2_store_id = "compliant_example_1"
  member          = "serviceAccount:healthcare-sa@my-project.iam.gserviceaccount.com"

  # COMPLIANT: specific HL7 V2 store role — not a primitive role
  role = "roles/healthcare.hl7V2StoreViewer"
}
