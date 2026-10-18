package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint_with_model_garden_deployment.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint_with_model_garden_deployment.vars

conditions := [
  [
    {
      "situation_description": "Deletion protection must prevent unintended destruction",
      "remedies": [
        "Set deletion_policy to PREVENT and use an approved change process for deletion."
      ]
    },
    {
      "condition": "Deletion protection must be enabled",
      "policy_type": "whitelist",
      "attribute_path": [
        "deletion_policy"
      ],
      "values": [
        "PREVENT"
      ]
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
