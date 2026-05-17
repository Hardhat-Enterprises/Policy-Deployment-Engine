resource "google_pubsub_topic_iam_binding" "c" {
  topic = "c"
  role  = "roles/pubsub.publisher"

  members = [
    "serviceAccount:my-service-account@my-project.iam.gserviceaccount.com",
  ]
}
