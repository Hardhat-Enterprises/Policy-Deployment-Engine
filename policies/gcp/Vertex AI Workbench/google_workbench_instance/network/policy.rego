package terraform.gcp.security.vertex_ai_workbench.google_workbench_instance.network

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai_workbench.google_workbench_instance.vars

conditions := [
  [
    {
      "situation_description": "Ensure the instance is deployed into an approved VPC, not the default network. The default VPC has overly permissive firewall rules.",
      "remedies": ["Set gce_setup.network_interfaces.network to an approved VPC network resource."]
    },
    {
      "condition": "network is not specified (using default VPC)",
      "attribute_path": ["gce_setup", 0, "network_interfaces", 0, "network"],
      "values": null,
      "policy_type": "blacklist"
    },
    {
      "condition": "network must not reference the default VPC",
      "attribute_path": ["gce_setup", 0, "network_interfaces", 0, "network"],
      "values": ["default"],
      "policy_type": "blacklist"
    }
  ]
]
result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
