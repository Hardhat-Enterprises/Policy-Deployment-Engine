package terraform.gcp.security.vertex_ai_workbench.google_workbench_instance.gce_setup_network_interfaces_subnet

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai_workbench.google_workbench_instance.vars

conditions := [
  [
    {
      "situation_description": "Ensure a subnet is explicitly specified. If omitted, GCP auto-selects a subnet which may place the instance in an uncontrolled network segment.",
      "remedies": ["Set gce_setup.network_interfaces.subnet to an approved subnet resource."]
    },
    {
      "condition": "subnet is not specified",
      "attribute_path": ["gce_setup", 0, "network_interfaces", 0, "subnet"],
      "values": null,
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
