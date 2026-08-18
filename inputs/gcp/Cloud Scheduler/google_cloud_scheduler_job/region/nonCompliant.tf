resource "google_cloud_scheduler_job" "non_compliant_example_1" {
  name        = "non_compliant_example_1"
  project     = "PDE"
  description = "test job"
  schedule    = "*/2 * * * *"
  region      = "us-central1"

  pubsub_target {
    topic_name = "projects/PDE/topics/nc-topic"
    data       = base64encode("test")
  }
}
