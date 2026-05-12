resource "google_pubsub_subscription" "c" {
  name  = "c"
  topic = "projects/my-project/topics/my-topic"

  enable_exactly_once_delivery = true
}
