resource "google_sourcerepo_repository" "nc" {
  name    = "nc"
  project = "google_sourcerepo_repository.repository.project"

  pubsub_configs {
    topic          = "google_pubsub_topic.topic.id"
    message_format = "PROTOBUF"
  }
}