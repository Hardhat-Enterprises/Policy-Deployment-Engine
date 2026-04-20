resource "google_blockchain_node_engine_blockchain_nodes" "nc" {
  project            = "my-secure-project"
  blockchain_node_id = "nc"
  location           = "asia-east1"
  blockchain_type    = ""

  ethereum_details {
    node_type        = "FULL"
    consensus_client = "LIGHTHOUSE"
    execution_client = "GETH"
    network          = "MAINNET"
  }
  labels = {
    environment = "dev"
  }
}
