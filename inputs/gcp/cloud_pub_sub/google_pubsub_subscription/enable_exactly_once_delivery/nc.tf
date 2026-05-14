resource "google_pubsub_subscription" "nc" {
  name  = "nc"
  topic = "projects/my-project/topics/my-topic"

  enable_exactly_once_delivery = false
}
