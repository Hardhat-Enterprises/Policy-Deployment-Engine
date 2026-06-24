resource "google_scc_notification_config" "nc" {
  config_id   = "nc"
  description = "Notification config with unapproved org"


  organization = "organizations/999999999999"

  pubsub_topic = "projects/security-core/topics/scc-findings"

  streaming_config {
    filter = "severity=\"HIGH\""
  }
}
