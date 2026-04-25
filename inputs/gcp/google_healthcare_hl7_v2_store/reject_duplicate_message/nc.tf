# Healthcare HL7v2 Store — reject_duplicate_message attribute (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "nc" {
  name     = "nc-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_hl7_v2_store" "nc" {
  dataset = google_healthcare_dataset.nc.id
  name    = "nc-hl7v2-store"

  # VIOLATION: false — duplicate HL7v2 messages are accepted, risking
  # double-processing of clinical events (duplicate orders, duplicate ADT events)
  # and corrupting the integrity of the patient record
  reject_duplicate_message = false

  labels = {
    environment         = "prod"
    owner               = "healthcare-team"
    data-classification = "phi"
    cost-center         = "cc-001"
    compliance          = "hipaa"
  }
}
