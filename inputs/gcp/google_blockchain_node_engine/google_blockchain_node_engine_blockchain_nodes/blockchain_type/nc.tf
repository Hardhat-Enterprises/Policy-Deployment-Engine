resource "google_blockchain_node_engine_blockchain_nodes" "bad_node" {
  location           = "us-central1"
  project            = "my-insecure-project"
  blockchain_node_id = "node-bad-1"
  blockchain_type    = ""
}