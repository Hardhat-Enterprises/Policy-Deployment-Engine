# Healthcare HL7 V2 Store - reject_duplicate_message (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_hl7_v2_store" "non_compliant_example_1" {
  dataset = "my-project/us-central1/example-dataset"
  name    = "non_compliant_example_1"

  # VIOLATION: false — duplicate messages accepted, may cause duplicate clinical events
  reject_duplicate_message = false
}
