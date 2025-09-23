resource "google_blockchain_node_engine_blockchain_nodes" "nc" {
  location           = "asia-east1"
  project            = "my-insecure-project"
  blockchain_node_id = "node-region-bad"
  blockchain_type    = "ETHEREUM"
}
