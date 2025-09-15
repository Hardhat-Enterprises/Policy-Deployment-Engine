resource "google_blockchain_node_engine_blockchain_nodes" "bad_node" {
  blockchain_node_id = "node-eth-testnet-1"
  blockchain_type    = "ETHEREUM"
  location           = "us-central1"
  project            = "my-insecure-project"

  ethereum_details {
    network = "TESTNET_GOERLI_PRATER"
  }
}
