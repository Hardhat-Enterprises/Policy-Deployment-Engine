resource "google_pubsub_subscription" "non_compliant_example_1" {
  name  = "non_compliant_example_1"
  topic = "projects/my-project/topics/my-topic"

  enable_exactly_once_delivery = false
}
