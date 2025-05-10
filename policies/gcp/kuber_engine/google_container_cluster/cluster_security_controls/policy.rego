package terraform.gcp.security.kuber_engine.google_container_cluster.cluster_security_controls

import data.terraform.gcp.helpers
import data.terraform.gcp.security.kuber_engine.google_container_cluster.cluster_security_controls.vars

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

  # Condition 2: enable_legacy_abac must be false
  [
    {
      "situation_description": "Legacy ABAC is enabled, which grants overly permissive static access.",
      "remedies": ["Disable enable_legacy_abac (set to false or remove it)"]
    },
    {
      "condition": "Legacy ABAC must be disabled",
      "attribute_path": ["enable_legacy_abac"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ],

  # Condition 3: enable_secure_boot must be true
  [
    {
      "situation_description": "Secure Boot is disabled in node_config.shielded_instance_config.",
      "remedies": ["Set node_config.shielded_instance_config.enable_secure_boot = true"]
    },
    {
      "condition": "Secure Boot must be enabled",
      "attribute_path": ["node_config", 0, "shielded_instance_config", 0, "enable_secure_boot"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
