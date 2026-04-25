resource "google_cloud_asset_folder_feed" "nc" {
  billing_project = "PDE"
  feed_id         = "nc"
  folder          = "folders/123456789"
  content_type    = "RESOURCE"

  asset_types = ["compute.googleapis.com/Instance"]

  feed_output_config {
    pubsub_destination {
      topic = "topicExample"
    }
  }
}