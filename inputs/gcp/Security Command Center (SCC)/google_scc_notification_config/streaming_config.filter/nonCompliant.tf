resource "google_scc_notification_config" "non_compliant_example_1" {
  config_id   = "non_compliant_example_1"
  description = "Valid config with proper streaming filter"

  organization = "organizations/123456789012"

  pubsub_topic = "projects/security-core/topics/scc-findings"

  streaming_config {
    filter = ""
  }
}
