resource "google_app_engine_service_split_traffic" "c" {
  service         = "web"
  migrate_traffic = true

  split {
    shard_by = "COOKIE"
    allocations = {
      v1 = 0.95
      v2 = 0.05
    }
  }
}
