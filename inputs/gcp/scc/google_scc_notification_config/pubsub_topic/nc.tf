resource "google_scc_notification_config" "nc" {
  organization  = "nc"
  config_id     = "scc_bad_pubsub"
  description   = "Non-compliant organization notification config"

  pubsub_topic = "projects/other-project/topics/unapproved-topic"

  streaming_config {
    filter = "severity=\"HIGH\" OR severity=\"CRITICAL\""
  }
}
