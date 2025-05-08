package terraform.gcp.security.kuber_engine.google_container_cluster.networking_maintenance_controls

import data.terraform.gcp.helpers
import data.terraform.gcp.security.kuber_engine.google_container_cluster.networking_maintenance_controls.vars

conditions := [

  # 1. default_snat_status must have disabled = true
  [
    {
      "situation_description": "Default SNAT is not disabled (in-node masquerading still active)",
      "remedies": ["Set default_snat_status.disabled = true"]
    },
    {
      "condition": "Ensure SNAT is disabled for better network control",
      "attribute_path": ["default_snat_status", 0, "disabled"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ],

  # 2. vertical_pod_autoscaling must be enabled
  [
    {
      "situation_description": "Vertical Pod Autoscaling is disabled",
      "remedies": ["Set vertical_pod_autoscaling.enabled = true"]
    },
    {
      "condition": "Ensure vertical pod autoscaling is enabled",
      "attribute_path": ["vertical_pod_autoscaling", 0, "enabled"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ],

  # 3. ip_allocation_policy.cluster_ipv4_cidr_block must not be empty
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

  # 4. ip_allocation_policy.services_ipv4_cidr_block must not be empty
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
