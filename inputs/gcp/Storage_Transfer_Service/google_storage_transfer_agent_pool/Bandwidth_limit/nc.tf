resource "google_storage_transfer_agent_pool" "nc" {
  name = "unsafe-bandwidth-pool"
  display_name = "unsafe-bandwidth-pool"

  bandwidth_limit {
    limit_mbps = "5000"
  }
}