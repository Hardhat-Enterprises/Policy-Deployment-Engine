resource "google_pubsub_topic" "nc_pubsub" {
  name        = "nc-topic"
  project     = "PDE"
}

resource "google_cloud_scheduler_job" "nc" {
  name        = "nc"
  project     = "PDE"
  description = "test job"
  schedule    = "*/2 * * * *"
  region      = "us-central1"
  

  pubsub_target {
    topic_name = google_pubsub_topic.nc_pubsub.id
    data       = base64encode("test")
  }
}