resource "google_blockchain_node_engine_blockchain_nodes" "bad_node" {
  location           = "us-central1"
  blockchain_node_id = "validnode456"
  project            = "my-secure-project"

  labels = {
    environment = "dev"
  }
}
