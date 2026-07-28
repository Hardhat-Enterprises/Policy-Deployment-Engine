resource "google_scc_notification_config" "non_compliant_example_1" {
  config_id   = "non_compliant_example_1"
  description = "Invalid config using unapproved Pub/Sub topic"

  organization = "organizations/123456789012"

  pubsub_topic = "projects/test-project/topics/tmp-topic"

  streaming_config {
    filter = "severity=\"HIGH\""
  }
}
