resource "google_blockchain_node_engine_blockchain_nodes" "c1" {
  project            = "my-secure-project"
  blockchain_node_id = "c"
  location           = "us-central1"
  blockchain_type    = "ETHEREUM"

  ethereum_details {
    api_enable_admin = false
    api_enable_debug = false
    validator_config {
      mev_relay_urls = ["https://mev1.example.org/", "https://mev2.example.org/"]
    }
    node_type        = "FULL"
    consensus_client = "LIGHTHOUSE"
    execution_client = "GETH"
    network          = "MAINNET"
  }

  labels = {
    environment = "prod"
  }

}