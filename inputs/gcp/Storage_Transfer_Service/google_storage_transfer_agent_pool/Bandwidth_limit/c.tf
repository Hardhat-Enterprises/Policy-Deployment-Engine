resource "google_storage_transfer_agent_pool" "c" {
  name = "c"
  display_name = "approved-bandwidth-pool"

  bandwidth_limit {
    limit_mbps = "250"
  }
}