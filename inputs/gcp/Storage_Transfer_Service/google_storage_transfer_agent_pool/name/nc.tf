resource "google_storage_transfer_agent_pool" "nc" {
  name         = "nc"
  display_name = "Non-compliant agent pool"

  bandwidth_limit {
    limit_mbps = "5000"
  }
}