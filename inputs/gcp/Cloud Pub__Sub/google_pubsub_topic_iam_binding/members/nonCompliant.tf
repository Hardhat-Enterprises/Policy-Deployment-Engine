resource "google_pubsub_topic_iam_binding" "non_compliant_example_1" {
  topic = "non_compliant_example_1"
  role  = "roles/pubsub.publisher"

  members = [
    "allUsers",
  ]
}
