resource "google_blockchain_node_engine_blockchain_nodes" "compliant_example_1" {
  project            = "my-secure-project"
  blockchain_node_id = "compliant_example_1"
  location           = "australia-southeast1"
  blockchain_type    = "ETHEREUM"

  ethereum_details {
    node_type        = "FULL"
    consensus_client = "LIGHTHOUSE"
    execution_client = "GETH"
    network          = "MAINNET"
  }

  labels = {
    environment = "prod"
  }

}
