resource "google_blockchain_node_engine_blockchain_nodes" "non_compliant_example_1" {
  project            = "my-secure-project"
  blockchain_node_id = "non_compliant_example_1"
  location           = "us-central1"
  blockchain_type    = "ETHEREUM"

  ethereum_details {
    node_type        = ""
    consensus_client = ""
    execution_client = ""
    network          = ""
  }
  labels = {
    environment = "dev"
  }
}
