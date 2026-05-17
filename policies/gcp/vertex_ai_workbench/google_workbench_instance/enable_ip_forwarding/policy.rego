package terraform.gcp.security.vertex_ai_workbench.google_workbench_instance.enable_ip_forwarding

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai_workbench.google_workbench_instance.vars

conditions := [
  [
    {
      "situation_description": "Ensure IP forwarding is disabled. A notebook has no legitimate need to route traffic. Enabling it allows lateral movement between networks.",
      "remedies": ["Set gce_setup.enable_ip_forwarding to false or omit the field (defaults to false)."]
    },
    {
      "condition": "enable_ip_forwarding is set to true",
      "attribute_path": ["gce_setup", 0, "enable_ip_forwarding"],
      "values": [true],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
