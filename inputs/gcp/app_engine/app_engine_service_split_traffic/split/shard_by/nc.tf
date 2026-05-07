resource "google_app_engine_service_split_traffic" "nc" {
  project = "gcp-project-12345"
  service = "liveapp"
  split {
    shard_by = "RANDOM"
    allocations = {
      "v1" = 0.5
      "v2" = 0.5
    }
  }
}