resource "google_blockchain_node_engine_blockchain_nodes" "nc1" {
  project            = "my-secure-project"
  blockchain_node_id = "nc1"
  location           = "asia-east1"
  blockchain_type    = ""

  ethereum_details {
    node_type        = ""
    consensus_client = ""
    execution_client = "GETH"
    network          = ""
  }
  labels = {
    environment = "dev"
  }
}
