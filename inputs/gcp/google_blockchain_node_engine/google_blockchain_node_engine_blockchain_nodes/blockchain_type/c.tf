resource "google_blockchain_node_engine_blockchain_nodes" "good_node" {
  location           = "us-central1"
  project            = "my-secure-project"
  blockchain_node_id = "node-eth-mainnet-1"
  blockchain_type    = "ETHEREUM"
}
