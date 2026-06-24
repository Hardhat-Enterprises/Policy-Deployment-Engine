package terraform.gcp.security.vertex_ai_workbench.google_workbench_instance.gce_setup_tags

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai_workbench.google_workbench_instance.vars

conditions := [
  [
    {
      "situation_description": "Ensure network tags are applied. Tags are used to target VPC firewall rules. Without them, the instance may not be subject to the correct network security controls.",
      "remedies": ["Set gce_setup.tags to include approved network tags (e.g. [\"notebook-restricted\", \"no-internet\"])."]
    },
    {
      "condition": "tags is not specified",
      "attribute_path": ["gce_setup", 0, "tags"],
      "values": null,
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
