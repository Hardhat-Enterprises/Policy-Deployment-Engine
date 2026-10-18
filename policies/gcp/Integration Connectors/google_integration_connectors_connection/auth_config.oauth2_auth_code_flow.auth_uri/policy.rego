package terraform.gcp.security.integration_connectors.google_integration_connectors_connection.auth_config_oauth2_auth_code_flow_auth_uri

import data.terraform.helpers
import data.terraform.gcp.security.integration_connectors.google_integration_connectors_connection.vars

conditions := [
  [
    {
      "situation_description": "The authorization endpoint is reached over plain HTTP, exposing the authorization request and the returned code to anyone on the network path.",
      "remedies": [
        "Use an https:// authorization URL."
      ]
    },
    {
      "condition": "auth_uri must use the https scheme.",
      "attribute_path": ["auth_config", 0, "oauth2_auth_code_flow", 0, "auth_uri"],
      "values": [
        "*://*",
        [["http"], []]
      ],
      "policy_type": "pattern blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
