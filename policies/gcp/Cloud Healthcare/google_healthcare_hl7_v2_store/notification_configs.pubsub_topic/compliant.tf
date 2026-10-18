# Healthcare HL7 V2 Store - notification_config (compliant)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_hl7_v2_store" "compliant_example_1" {
  dataset = "my-project/us-central1/example-dataset"
  name    = "compliant_example_1"

  # COMPLIANT: notification_configs set — HL7 V2 store changes published to Pub/Sub for audit
  notification_configs {
    pubsub_topic = "projects/my-project/topics/healthcare-hl7-notifications"
  }
}
