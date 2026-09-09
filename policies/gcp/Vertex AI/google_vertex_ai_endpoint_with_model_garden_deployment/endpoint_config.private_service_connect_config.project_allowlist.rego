package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint_with_model_garden_deployment.endpoint_config_private_service_connect_config_project_allowlist

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint_with_model_garden_deployment.vars

conditions := [
  [
    {
      "situation_description": "Private Service Connect consumer projects must be explicitly scoped",
      "remedies": [
        "Specify an approved, nonempty list of consumer project IDs or numbers and remove wildcard entries."
      ]
    },
    {
      "condition": "Consumer project allowlist is missing or empty",
      "policy_type": "blacklist",
      "attribute_path": [
        "endpoint_config",
        0,
        "private_service_connect_config",
        0,
        "project_allowlist"
      ],
      "values": [
        null,
        []
      ]
    },
    {
      "condition": "Wildcard consumer project entries are prohibited",
      "policy_type": "element blacklist",
      "attribute_path": [
        "endpoint_config",
        0,
        "private_service_connect_config",
        0,
        "project_allowlist"
      ],
      "values": [
        "*"
      ]
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
