resource "google_cloud_asset_folder_feed" "nc" {
  billing_project = "PDE"
  feed_id         = "nc"
  folder          = "folders/123456789"
  content_type    = "RESOURCE"

  asset_types = ["storage.googleapis.com/Bucket"]

  feed_output_config {
    pubsub_destination {
      topic = "projects/projectExample/topics/topicExample"
    }
  }
}