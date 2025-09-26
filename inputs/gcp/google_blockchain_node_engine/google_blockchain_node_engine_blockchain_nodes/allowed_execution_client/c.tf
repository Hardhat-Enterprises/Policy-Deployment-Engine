resource "google_blockchain_node_engine_blockchain_nodes" "c1" {
  location           = "us-central1"
  project            = "my-secure-project"
  blockchain_node_id = "c1"
  blockchain_type    = "ETHEREUM"

  ethereum_details {
    network = "MAINNET"
    execution_client  = "ERIGON"

    validator_config {
      mev_relay_urls = [
        "https://relay.flashbots.net/",
        "https://trusted.mev.org/"
      ]
    }
  }
}
