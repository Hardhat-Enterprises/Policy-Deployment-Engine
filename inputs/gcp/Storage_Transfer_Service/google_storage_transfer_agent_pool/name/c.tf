resource "google_storage_transfer_agent_pool" "c" {
  name         = "agent-pool-example"
  display_name = "Compliant agent pool"

  bandwidth_limit {
    limit_mbps = "250"
  }
}