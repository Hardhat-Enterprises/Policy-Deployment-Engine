resource "google_blockchain_node_engine_blockchain_nodes" "nc1" {
  location           = "asia-east1"
  project            = "my-insecure-project"
  blockchain_node_id = "nc1"
  blockchain_type    = "ETHEREUM"
}
