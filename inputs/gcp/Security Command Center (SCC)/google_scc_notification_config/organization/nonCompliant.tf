resource "google_scc_notification_config" "non_compliant_example_1" {
  config_id   = "non_compliant_example_1"
  description = "Notification config with approved org"

  organization = "organizations/999999999999"

  pubsub_topic = "projects/security-core/topics/scc-findings"

  streaming_config {
    filter = "severity=\"HIGH\" OR severity=\"CRITICAL\""
  }
}
