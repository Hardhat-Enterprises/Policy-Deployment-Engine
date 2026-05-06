resource "google_cloud_asset_folder_feed" "c" {
  billing_project = "PDE"
  folder          = "folders/123456789"
  feed_id         = "c"
  content_type    = "RESOURCE"

  asset_types = ["compute.googleapis.com/Instance"]

  feed_output_config {
    pubsub_destination {
      topic = "projects/projectExample/topics/topicExample"
    }
  }
}