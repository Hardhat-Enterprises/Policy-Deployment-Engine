resource "google_blockchain_node_engine_blockchain_nodes" "c1" {
  location           = "us-central1"
  project            = "my-secure-project"
  blockchain_type    = "ETHEREUM"
  blockchain_node_id = "c1"
}
