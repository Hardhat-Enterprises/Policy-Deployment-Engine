# Healthcare HL7v2 Store — notification_config attribute (non-compliant)
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_healthcare_dataset" "nc" {
  name     = "nc-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_hl7_v2_store" "nc" {
  dataset = google_healthcare_dataset.nc.id
  name    = "nc-hl7v2-store"

  # VIOLATION: No notification_configs block — HL7v2 message events are not
  # published to Pub/Sub, making it impossible to audit or monitor
  # clinical message ingestion in real time

  labels = {
    environment         = "prod"
    owner               = "healthcare-team"
    data-classification = "phi"
    cost-center         = "cc-001"
    compliance          = "hipaa"
  }
}
