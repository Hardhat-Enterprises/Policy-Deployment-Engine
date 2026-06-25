resource "google_pubsub_subscription" "compliant_example_1" {
  name  = "compliant_example_1"
  topic = "projects/my-project/topics/my-topic"

  enable_exactly_once_delivery = true
}
