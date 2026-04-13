resource "google_app_engine_service_split_traffic" "nc" {
  project         = "gcp-project-12345"
  service         = "hardhat-main-api"
  migrate_traffic = true
  split {
    shard_by    = "IP"
    allocations = { "v1" = 0.5, "v2" = 0.5 }
  }
}