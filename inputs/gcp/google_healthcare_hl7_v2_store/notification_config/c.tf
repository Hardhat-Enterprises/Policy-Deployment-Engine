# Healthcare HL7v2 Store — notification_config attribute (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_dataset" "c" {
  name     = "compliant-dataset"
  location = "australia-southeast1"
}

resource "google_healthcare_hl7_v2_store" "c" {
  dataset = google_healthcare_dataset.c.id
  name    = "compliant-hl7v2-store"

  # COMPLIANT: notification_config set — HL7v2 message events published
  # to Pub/Sub enabling real-time audit and downstream processing
  notification_configs {
    pubsub_topic = "projects/my-project/topics/healthcare-hl7v2-notifications"
  }

  labels = {
    environment         = "prod"
    owner               = "healthcare-team"
    data-classification = "phi"
    cost-center         = "cc-001"
    compliance          = "hipaa"
  }
}
