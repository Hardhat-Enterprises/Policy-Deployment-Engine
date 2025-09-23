resource "google_blockchain_node_engine_blockchain_nodes" "c" {
  location           = "us-central1"
  project            = "my-secure-project"
  blockchain_node_id = "node-region-1"
  blockchain_type    = "ETHEREUM"
}
