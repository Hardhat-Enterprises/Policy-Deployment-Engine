# Healthcare HL7 V2 Store IAM - member (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_hl7_v2_store_iam_member" "non_compliant_example_1" {
  provider        = google-beta
  hl7_v2_store_id = "non_compliant_example_1"
  role            = "roles/healthcare.hl7V2StoreViewer"

  # VIOLATION: allUsers grants public unauthenticated access to clinical messaging data
  member = "allUsers"
}
