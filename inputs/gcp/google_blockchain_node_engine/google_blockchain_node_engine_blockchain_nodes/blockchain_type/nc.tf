resource "google_blockchain_node_engine_blockchain_nodes" "nc1" {
  location           = "india"
  project            = "my-insecure-project"
  blockchain_type    = "bitcoin" 
  labels             = "nc1"
}
