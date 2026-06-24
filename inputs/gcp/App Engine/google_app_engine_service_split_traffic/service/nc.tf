resource "google_app_engine_service_split_traffic" "nc" {
  project = "gcp-project-12345"
  service = "generic-api"
  split {
    shard_by = "IP"
    allocations = {
      "v1" = 1.0
    }
  }
}