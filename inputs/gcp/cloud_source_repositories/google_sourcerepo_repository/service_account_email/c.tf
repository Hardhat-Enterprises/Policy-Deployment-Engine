resource "google_sourcerepo_repository" "c" {
  name    = "c"
  project = "google_sourcerepo_repository.repository.project"

  pubsub_configs {
    topic                 = "google_pubsub_topic.topic.id"
    message_format        = "JSON"
    service_account_email = "service-account@project-id.iam.gserviceaccount.com"
  }

}