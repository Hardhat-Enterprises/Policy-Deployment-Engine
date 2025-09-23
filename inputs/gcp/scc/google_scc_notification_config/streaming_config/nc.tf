resource "google_scc_notification_config" "nc" {
  config_id   = "nc"
  description = "Invalid config with weak/empty streaming filter"

  organization = "organizations/123456789012"

  pubsub_topic = "projects/security-core/topics/scc-findings"


  streaming_config {
    filter = ""
  }
}