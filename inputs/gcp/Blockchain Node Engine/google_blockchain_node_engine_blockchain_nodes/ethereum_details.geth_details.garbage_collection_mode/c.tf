resource "google_blockchain_node_engine_blockchain_nodes" "c" {
  project            = "my-secure-project"
  blockchain_node_id = "c"
  location           = "us-central1"
  blockchain_type    = "ETHEREUM"

  ethereum_details {
    node_type        = "FULL"
    consensus_client = "LIGHTHOUSE"
    execution_client = "GETH"
    network          = "MAINNET"
    geth_details {
      garbage_collection_mode = "FULL"
    }
  }

  labels = {
    environment = "prod"
  }

}