resource "google_scc_notification_config" "nc" {
  organization  = "nc"
  config_id     = "scc_bad_stream"
  description   = "Non-compliant organization notification config with weak streaming filter"

  pubsub_topic = "projects/my-project/topics/security-events"

  streaming_config {
    filter = "severity=\"LOW\" OR severity=\"MEDIUM\""
  }
}