resource "google_sourcerepo_repository" "compliant_example_1" {
  name    = "compliant_example_1"
  project = "google_sourcerepo_repository.repository.project"

  pubsub_configs {
    topic          = "google_pubsub_topic.topic.id"
    message_format = "JSON"
  }

}

