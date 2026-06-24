resource "google_app_engine_service_split_traffic" "c" {
  project = "gcp-project-12345"
  service = "hardhat-main-api"
  split {
    shard_by = "IP"
    allocations = {
      "v1" = 0.5
      "v2" = 0.5
    }
  }
}