resource "google_scc_notification_config" "nc" {
  organization  = "nc"
  config_id     = "scc_bad_config"
  description   = "Non-compliant organization notification config with unapproved config_id"

  pubsub_topic = "projects/my-project/topics/security-events"

  streaming_config {
    filter = "severity=\"HIGH\" OR severity=\"CRITICAL\""
  }
}
