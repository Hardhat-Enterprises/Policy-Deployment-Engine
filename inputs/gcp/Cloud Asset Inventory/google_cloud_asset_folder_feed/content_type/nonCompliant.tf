resource "google_cloud_asset_folder_feed" "non_compliant_example_1" {
  billing_project = "PDE"
  folder          = "folders/123456789"
  feed_id         = "non_compliant_example_1"
  content_type    = "OS_INVENTORY"

  asset_types = ["compute.googleapis.com/Instance"]

  feed_output_config {
    pubsub_destination {
      topic = "projects/projectExample/topics/topicExample"
    }
  }
}
