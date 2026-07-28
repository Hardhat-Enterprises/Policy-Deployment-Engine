# Healthcare HL7 V2 Store - reject_duplicate_message (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_hl7_v2_store" "compliant_example_1" {
  dataset = "my-project/us-central1/example-dataset"
  name    = "compliant_example_1"

  # COMPLIANT: true — duplicate messages rejected, preventing duplicate clinical events
  reject_duplicate_message = true
}
