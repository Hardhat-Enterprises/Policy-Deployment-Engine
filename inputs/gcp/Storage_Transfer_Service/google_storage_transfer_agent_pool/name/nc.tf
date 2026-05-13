resource "google_storage_transfer_agent_pool" "nc" {
  name = "projects/my-project-123/agentPools/googUnsafePool"
  display_name = "googUnsafePool"

  bandwidth_limit {
    limit_mbps = "250"
  }
}