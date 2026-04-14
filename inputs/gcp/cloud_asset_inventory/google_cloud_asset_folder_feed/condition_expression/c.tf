resource "google_cloud_asset_folder_feed" "c" {
  billing_project = "PDE"
  feed_id         = "c"
  folder          = "folders/123456789"
  content_type    = "RESOURCE"

  asset_types = ["compute.googleapis.com/Instance"]

  condition {
    expression = "temporal_asset.deleted == true"
  }

  feed_output_config {
    pubsub_destination {
      topic = "projects/projectExample/topics/topicExample"
    }
  }
}