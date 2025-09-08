resource "google_blockchain_node_engine_blockchain_nodes" "nc" {
  location           = "europe-west1"  # ❌ Not in allowed location
  blockchain_type    = "ETHEREUM"
  blockchain_node_id = "BadNodeID"     # ❌ Capital letters not allowed

  ethereum_details {
    api_enable_admin = false           # ❌ Admin API should be enabled
    api_enable_debug = true
    node_type        = "LIGHT"         # ❌ Must be FULL or ARCHIVE
    consensus_client = "CONSENSUS_CLIENT_UNSPECIFIED"
    execution_client = "EXECUTION_CLIENT_UNSPECIFIED"
    network          = "TESTNET_GOERLI_PRATER"
  }

  labels = {
    owner = "test-user"                # ❌ Missing environment label
  }
}
