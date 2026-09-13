package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint_with_model_garden_deployment.endpoint_config_private_service_connect_config_enable_private_service_connect

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint_with_model_garden_deployment.vars

conditions := [
  [
    {
      "situation_description": "Private Service Connect must be enabled for private model access",
      "remedies": [
        "Set enable_private_service_connect to true in the endpoint private_service_connect_config."
      ]
    },
    {
      "condition": "Private Service Connect is disabled",
      "policy_type": "whitelist",
      "attribute_path": [
        "endpoint_config",
        0,
        "private_service_connect_config",
        0,
        "enable_private_service_connect"
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
