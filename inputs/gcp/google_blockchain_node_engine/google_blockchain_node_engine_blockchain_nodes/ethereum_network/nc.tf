resource "google_blockchain_node_engine_blockchain_nodes" "nc_nc1network" {
  location           = "us-central1"
  project            = "my-secure-project"
  blockchain_node_id = "nc1"
  blockchain_type    = "ETHEREUM"

  ethereum_details {
    network = "GOERLI"
    geth_details {
      node_type = "FULL_NODE"
    }
  }

  logging_enabled = true
  disk_size_gb    = 1000
}
