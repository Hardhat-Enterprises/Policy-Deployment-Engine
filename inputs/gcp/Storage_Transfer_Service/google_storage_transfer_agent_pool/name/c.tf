resource "google_storage_transfer_agent_pool" "c" {
  name = "c"
  display_name = "approved-agent-pool"

  bandwidth_limit {
    limit_mbps = "250"
  }
}