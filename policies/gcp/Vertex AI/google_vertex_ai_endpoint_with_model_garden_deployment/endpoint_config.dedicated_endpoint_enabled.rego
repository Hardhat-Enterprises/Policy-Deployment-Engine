package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint_with_model_garden_deployment.endpoint_config.dedicated_endpoint_enabled

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint_with_model_garden_deployment.vars

conditions := [
  [
    {
      "situation_description": "Dedicated endpoint traffic isolation must be enabled",
      "remedies": [
        "Set endpoint_config.dedicated_endpoint_enabled to true."
      ]
    },
    {
      "condition": "Dedicated endpoint is disabled",
      "policy_type": "whitelist",
      "attribute_path": [
        "endpoint_config",
        0,
        "dedicated_endpoint_enabled"
      ],
      "values": [
        true
      ]
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
