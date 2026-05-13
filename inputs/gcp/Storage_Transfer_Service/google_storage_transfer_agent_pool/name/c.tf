resource "google_storage_transfer_agent_pool" "c" {
  name = "projects/my-project-123/agentPools/approved-pool-1"
  display_name = "approved-pool-1"

  bandwidth_limit {
    limit_mbps = "250"
  }
}