package terraform.gcp.security.vertex_ai_workbench.vertex_ai_workbench.google_workbench_instance.network_interfaces.access_configs

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai_workbench.vertex_ai_workbench.google_workbench_instance.vars

conditions := [
  [
    {
      "situation_description": "Ensure no access_configs block assigns a static external IP. A static public IP makes the instance persistently reachable from the internet.",
      "remedies": ["Remove the gce_setup.network_interfaces.access_configs block entirely."]
    },
    {
      "condition": "access_configs external_ip is specified",
      "attribute_path": ["gce_setup", 0, "network_interfaces", 0, "access_configs", 0, "external_ip"],
      "values": null,
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
