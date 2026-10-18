resource "google_pubsub_subscription_iam_binding" "non_compliant_example_1" {
  subscription = "non_compliant_example_1"
  role         = "roles/pubsub.subscriber"

  members = [
    "allAuthenticatedUsers",
  ]
}
