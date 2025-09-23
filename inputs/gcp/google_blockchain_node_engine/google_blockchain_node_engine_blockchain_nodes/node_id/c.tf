resource "google_blockchain_node_engine_blockchain_nodes" "c" {
  location           = "us-central1"
  blockchain_node_id = "validnode123"
  project            = "my-secure-project"

  labels = {
    environment = "prod"
  }
}
