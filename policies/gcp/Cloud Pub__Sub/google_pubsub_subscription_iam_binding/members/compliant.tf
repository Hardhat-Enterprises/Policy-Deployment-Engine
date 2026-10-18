resource "google_pubsub_subscription_iam_binding" "compliant_example_1" {
  subscription = "compliant_example_1"
  role         = "roles/pubsub.subscriber"

  members = [
    "serviceAccount:my-service-account@my-project.iam.gserviceaccount.com",
  ]
}
