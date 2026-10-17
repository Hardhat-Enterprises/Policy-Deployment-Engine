package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint_with_model_garden_deployment.model_config_hugging_face_access_token

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint_with_model_garden_deployment.vars

conditions := [
  [
    {
      "situation_description": "Hugging Face credentials must not be stored directly in Terraform",
      "remedies": [
        "Remove the direct access token and use an approved secret-delivery mechanism."
      ]
    },
    {
      "condition": "Direct Hugging Face token must not be configured",
      "policy_type": "whitelist",
      "attribute_path": [
        "model_config",
        0,
        "hugging_face_access_token"
      ],
      "values": [
        null,
        ""
      ]
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
