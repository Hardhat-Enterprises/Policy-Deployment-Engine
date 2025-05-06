# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_healthcare_hl7_v2_store" "nc" {
    name = "testhl7v2store-nc"
    dataset = "google_healthcare_dataset.nc.id"

    notification_configs {
    pubsub_topic = "projects/project/topics/public-topic"

    filter = "" # No filter = all messages leaked
  }
}
