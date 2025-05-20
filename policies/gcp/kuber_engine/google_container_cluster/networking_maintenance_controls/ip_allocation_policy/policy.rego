package terraform.gcp.security.kuber_engine.google_container_cluster.networking_maintenance_controls

import data.terraform.gcp.helpers
import data.terraform.gcp.security.kuber_engine.google_container_cluster.vars

conditions := [

  [
    {
      "situation_description": "Pod IP CIDR block is not configured",
      "remedies": ["Set ip_allocation_policy.cluster_ipv4_cidr_block to a valid RFC1918 block"]
    },
    {
      "condition": "Ensure pod IP block is defined",
      "attribute_path": ["ip_allocation_policy", 0, "cluster_ipv4_cidr_block"],
      "values": ["10.100.0.0/14"],
      "policy_type": "whitelist"
    }
  ],

  [
    {
      "situation_description": "Service IP CIDR block is not configured",
      "remedies": ["Set ip_allocation_policy.services_ipv4_cidr_block to a valid RFC1918 block"]
    },
    {
      "condition": "Ensure service IP block is defined",
      "attribute_path": ["ip_allocation_policy", 0, "services_ipv4_cidr_block"],
      "values": ["10.96.0.0/20"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
