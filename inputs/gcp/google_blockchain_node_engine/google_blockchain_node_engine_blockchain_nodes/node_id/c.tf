resource "google_blockchain_node_engine_blockchain_nodes" "c1" {
  location           = "us-central1"
  blockchain_node_id = "c1"
  project            = "my-secure-project"

  labels = {
    environment = "prod"
  }
}
