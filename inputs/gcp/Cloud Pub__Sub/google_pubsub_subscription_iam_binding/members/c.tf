resource "google_pubsub_subscription_iam_binding" "c" {
  subscription = "c"
  role         = "roles/pubsub.subscriber"

  members = [
    "serviceAccount:my-service-account@my-project.iam.gserviceaccount.com",
  ]
}
