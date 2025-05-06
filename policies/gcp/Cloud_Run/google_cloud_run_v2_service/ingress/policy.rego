package terraform.gcp.security.Cloud_Run.google_cloud_run_v2_service.label

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Run.google_cloud_run_v2_service.vars

conditions := [
  [
    {
      "situation_description": "Cloud Run service is missing required labels: env, owner, cost-center.",
      "remedies": [
        "Add the required labels under the 'labels' block.",
        "Example: labels = { env = \"prod\", owner = \"security-team\", cost-center = \"cc-12345\" }"
      ]
    },
    {
      "condition": "Ensure required labels exist",
      "attribute_path": ["labels"],
      "values": [["env", "owner", "cost-center"]],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
