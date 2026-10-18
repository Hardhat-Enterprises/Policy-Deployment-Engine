resource "google_cloud_scheduler_job" "compliant_example_1" {
  name        = "compliant_example_1"
  project     = "PDE"
  description = "test job"
  schedule    = "*/2 * * * *"
  region      = "australia-southeast1"

  pubsub_target {
    topic_name = "projects/PDE/topics/c-topic"
    data       = base64encode("test")
  }
}
