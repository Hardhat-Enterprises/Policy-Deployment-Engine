resource "google_pubsub_topic_iam_binding" "compliant_example_1" {
  topic = "compliant_example_1"
  role  = "roles/pubsub.publisher"

  members = [
    "serviceAccount:my-service-account@my-project.iam.gserviceaccount.com",
  ]
}
