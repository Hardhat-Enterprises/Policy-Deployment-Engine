package terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint_with_model_garden_deployment.location

import data.terraform.helpers
import data.terraform.gcp.security.vertex_ai.google_vertex_ai_endpoint_with_model_garden_deployment.vars

conditions := [
  [
    {
      "situation_description": "Deployment must use an approved data residency region",
      "remedies": [
        "Select an approved region from the organisation data-residency allowlist."
      ]
    },
    {
      "condition": "Deployment location is not approved",
      "policy_type": "whitelist",
      "attribute_path": [
        "location"
      ],
      "values": [
        "australia-southeast1",
        "australia-southeast2"
      ]
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
