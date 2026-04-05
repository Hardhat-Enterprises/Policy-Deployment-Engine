resource "google_pubsub_topic" "c_pubsub" {
  name        = "c-topic"
  project     = "PDE"
}

resource "google_cloud_scheduler_job" "c" {
  name        = "c"
  project     = "PDE"
  description = "test job"
  schedule    = "*/2 * * * *"
  time_zone   = "Australia/Melbourne"
  region      = "australia-southeast1"

  pubsub_target {
    # topic.id is the topic's full resource name.
    topic_name = google_pubsub_topic.c_pubsub.id
    data       = base64encode("test")
  }
}