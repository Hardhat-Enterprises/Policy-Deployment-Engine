resource "google_blockchain_node_engine_blockchain_nodes" "compliant_example_1" {
  project            = "my-secure-project"
  blockchain_node_id = "compliant_example_1"
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
