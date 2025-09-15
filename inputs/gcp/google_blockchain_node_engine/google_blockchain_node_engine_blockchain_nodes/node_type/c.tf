resource "google_blockchain_node_engine_blockchain_nodes" "good_node" {
  blockchain_node_id = "node-eth-mainnet-1"
  blockchain_type    = "ETHEREUM"
  location           = "us-central1"
  project            = "my-secure-project"

  ethereum_details {
    network = "MAINNET"
  }
}
