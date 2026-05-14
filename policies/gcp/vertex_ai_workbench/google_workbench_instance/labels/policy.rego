package terraform.gcp.security.vertex_ai_workbench.google_workbench_instance.labels

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai_workbench.google_workbench_instance.vars

conditions := [
  [
    {
      "situation_description": "Ensure labels are applied to the instance. Labels are required for cost allocation, ownership tracking, and security policy enforcement.",
      "remedies": ["Add labels to the resource (e.g. labels = { environment = \"dev\", team = \"data-science\" })."]
    },
    {
      "condition": "labels is empty or not specified",
      "attribute_path": ["labels"],
      "values": null,
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
