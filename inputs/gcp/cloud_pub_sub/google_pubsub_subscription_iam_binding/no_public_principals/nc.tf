resource "google_pubsub_subscription_iam_binding" "nc" {
  subscription = "nc"
  role         = "roles/pubsub.subscriber"

  members = [
    "allAuthenticatedUsers",
  ]
}
