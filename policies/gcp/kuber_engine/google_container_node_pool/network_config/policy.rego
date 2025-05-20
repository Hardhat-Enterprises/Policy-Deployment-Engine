package terraform.gcp.security.kuber_engine.google_container_node_pool.network_config

import data.terraform.gcp.helpers
import data.terraform.gcp.security.kuber_engine.google_container_node_pool.vars

conditions := [
  [
    {
      "situation_description": "Node pool is not using private nodes, meaning the nodes are exposed with public IPs, which is a security risk.",
      "remedies": ["Enable 'enable_private_nodes' in network_config to restrict node IPs to internal access only."]
    },
    {
      "condition": "Check if private nodes are enabled.",
      "attribute_path": ["network_config", 0, "enable_private_nodes"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ],
  [
    {
      "situation_description": "Pod CIDR block is too permissive (0.0.0.0/0), which allows unrestricted IP ranges.",
      "remedies": ["Set a specific private IP range for pod_ipv4_cidr_block (e.g., 10.0.0.0/14)."]
    },
    {
      "condition": "Check that pod_ipv4_cidr_block is not an open range.",
      "attribute_path": ["network_config", 0, "pod_ipv4_cidr_block"],
      "values": ["0.0.0.0/0"],
      "policy_type": "blacklist"
    }
  ],
  [
    {
      "situation_description": "Pod CIDR overprovision is disabled, reducing efficiency and flexibility in pod IP allocation.",
      "remedies": ["Set 'pod_cidr_overprovision_config.disabled' to false to enable overprovisioning."]
    },
    {
      "condition": "Check that overprovisioning is enabled.",
      "attribute_path": ["network_config", 0, "pod_cidr_overprovision_config", 0, "disabled"],
      "values": [false],
      "policy_type": "whitelist"
    }
  ]
]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
