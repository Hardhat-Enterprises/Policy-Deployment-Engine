resource "google_cloud_asset_folder_feed" "non_compliant_example_1" {
  billing_project = "PDE"
  feed_id         = "non_compliant_example_1"
  folder          = "folders/123456789"
  content_type    = "RESOURCE"

  asset_types = ["storage.googleapis.com/Bucket"]

  feed_output_config {
    pubsub_destination {
      topic = "projects/projectExample/topics/topicExample"
    }
  }
}
