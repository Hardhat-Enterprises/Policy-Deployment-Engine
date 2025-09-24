resource "google_app_engine_service_split_traffic" "nc" {
  service         = "payments"
  migrate_traffic = false

  split {
    shard_by = "RANDOM"
    allocations = {
      v1 = 0.60
      v2 = 0.40
    }
  }
}
