package terraform.gcp.security.kuber_engine.google_container_cluster.cluster_security_controls

import data.terraform.gcp.helpers
import data.terraform.gcp.security.kuber_engine.google_container_cluster.vars

conditions := [

  # Condition 1: master_authorized_networks_config must not allow 0.0.0.0/0
  [
    {
      "situation_description": "Cluster allows public (0.0.0.0/0) access to master via master_authorized_networks_config.",
      "remedies": ["Remove or restrict 0.0.0.0/0 from master_authorized_networks_config.cidr_blocks"]
    },
    {
      "condition": "Master Authorized Networks must not include 0.0.0.0/0",
      "attribute_path": ["master_authorized_networks_config", 0, "cidr_blocks", 0, "cidr_block"],
      "values": ["0.0.0.0/0"],
      "policy_type": "blacklist"
    }
  ],

]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
