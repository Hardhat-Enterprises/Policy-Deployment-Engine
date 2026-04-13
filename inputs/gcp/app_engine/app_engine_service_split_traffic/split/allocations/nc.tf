resource "google_app_engine_service_split_traffic" "nc" {
  project = "gcp-project-12345"
  service = "liveapp"
  split {
    shard_by = "IP"
    allocations = {
      "v1" = 0.0
      "v2" = 1.0
    }
  }
}