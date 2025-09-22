resource "google_scc_notification_config" "c" {
  organization  = "c"
  config_id     = "scc_good_stream"
  description   = "Compliant organization notification config with strong streaming filter"

  pubsub_topic = "projects/my-project/topics/security-events"

  streaming_config {
    filter = "severity=\"HIGH\" OR severity=\"CRITICAL\""
  }
}