resource "google_app_engine_service_split_traffic" "c" {
    project = "gcp-project-12345"
  service = "liveapp"
  split {
    shard_by = "IP"
    allocations = {
      "v1" = 0.8
      "v2" = 0.2
    }
  }
}