resource "google_blockchain_node_engine_blockchain_nodes" "non_compliant_example_1" {
  project            = "my-secure-project"
  blockchain_node_id = "non_compliant_example_1"
  location           = "us-central1"
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
