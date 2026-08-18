resource "google_blockchain_node_engine_blockchain_nodes" "non_compliant_example_1" {
  project            = "my-secure-project"
  blockchain_node_id = "non_compliant_example_1"
  location           = "asia-east1"
  blockchain_type    = ""

  ethereum_details {
    api_enable_admin = true
    api_enable_debug = true
    validator_config {
      mev_relay_urls = ["https://example.org/"]
    }
    node_type        = "FULL"
    consensus_client = "LIGHTHOUSE"
    execution_client = "GETH"
    network          = "MAINNET"
  }
  labels = {
    environment = "dev"
  }
}
