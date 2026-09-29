package terraform.gcp.security.integration_connectors.google_integration_connectors_connection.location

import data.terraform.helpers
import data.terraform.gcp.security.integration_connectors.google_integration_connectors_connection.vars

conditions := [
  [
    {
      "situation_description": "The connection is created outside the approved regions, placing integration data and its runtime in a jurisdiction the organisation has not accepted.",
      "remedies": [
        "Set location to one of the approved regions for this organisation."
      ]
    },
    {
      "condition": "location must be one of the approved regions.",
      "attribute_path": ["location"],
      "values": ["australia-southeast1", "australia-southeast2"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
