resource "google_blockchain_node_engine_blockchain_nodes" "nc1" {
  location           = "us-central1"
  blockchain_node_id = "nc1"
  project            = "my-secure-project"

  labels = {
    environment = "dev"
  }
}
