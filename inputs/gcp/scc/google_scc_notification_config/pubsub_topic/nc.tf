resource "google_scc_notification_config" "nc" {
  config_id   = "nc"
  description = "Invalid config using unapproved Pub/Sub topic"

  organization = "organizations/123456789012"

  pubsub_topic = "projects/test-project/topics/tmp-topic"

  streaming_config {
    filter = "severity=\"HIGH\""
  }
}
