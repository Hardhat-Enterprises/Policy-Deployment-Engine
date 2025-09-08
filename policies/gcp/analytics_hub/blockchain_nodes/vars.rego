package terraform.gcp.blockchain_node_engine.blockchain_nodes

# Allowed deployment locations
default allowed_locations = ["us-central1"]

# Required labels
default required_labels = {
  "environment": "dev"
}
