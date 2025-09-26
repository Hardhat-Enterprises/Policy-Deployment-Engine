resource "google_blockchain_node_engine_blockchain_nodes" "nc1" {
  location           = "us-central1"
  project            = "my-secure-project"
  blockchain_node_id = "nc1"
  blockchain_type    = "ETHEREUM"

  ethereum_details {
    network = "MAINNET"
    consensus_client  = "CONSENSUS_CLIENT_UNSPECIFIED"

    validator_config {
      mev_relay_urls = [
        "https://relay.flashbots.net/",
        "https://trusted.mev.org/"
      ]
    }
  }
}
