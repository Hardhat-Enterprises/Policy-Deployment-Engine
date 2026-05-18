resource "google_pubsub_topic_iam_binding" "nc" {
  topic = "nc"
  role  = "roles/pubsub.publisher"

  members = [
    "allUsers",
  ]
}
