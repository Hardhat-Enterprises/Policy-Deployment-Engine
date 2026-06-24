resource "google_pubsub_topic" "c_pubsub" {
  name        = "c-topic"
  project     = "PDE"
}

resource "google_cloud_scheduler_job" "c" {
  name        = "c"
  project     = "PDE"
  description = "test job"
  schedule    = "*/2 * * * *"
  region      = "australia-southeast1"
  paused      = "true"

  retry_config {
    retry_count = 3
  }

  pubsub_target {
    topic_name = google_pubsub_topic.c_pubsub.id
    data       = base64encode("test")
  }
}