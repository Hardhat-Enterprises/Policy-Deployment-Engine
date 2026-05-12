package terraform.gcp.security.vertex_ai_workbench.vertex_ai_workbench.google_workbench_instance.instance_owners

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai_workbench.vertex_ai_workbench.google_workbench_instance.vars

conditions := [
  [
    {
      "situation_description": "Ensure instance_owners is specified to enforce single-user access. If omitted, all service account users can access the notebook.",
      "remedies": ["Set instance_owners to a list containing the authorised user email (e.g. [\"user@example.com\"])."]
    },
    {
      "condition": "instance_owners is not specified",
      "attribute_path": ["instance_owners"],
      "values": null,
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
