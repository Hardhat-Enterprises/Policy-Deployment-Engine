package terraform.gcp.blockchain_node_engine.blockchain_nodes

import data.terraform.gcp.blockchain_node_engine.blockchain_nodes as bcn

results = {
  "deny": [msg | msg := bcn.deny[_]]
}
