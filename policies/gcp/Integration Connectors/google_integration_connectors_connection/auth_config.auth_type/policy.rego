package terraform.gcp.security.integration_connectors.google_integration_connectors_connection.auth_config_auth_type

import data.terraform.helpers
import data.terraform.gcp.security.integration_connectors.google_integration_connectors_connection.vars

conditions := [
  [
    {
      "situation_description": "The connection leaves its authentication mechanism undeclared rather than choosing one.",
      "remedies": [
        "Set auth_type to the mechanism the connector supports, such as USER_PASSWORD or one of the OAuth2 grants."
      ]
    },
    {
      "condition": "auth_config.auth_type must not be left unspecified.",
      "attribute_path": ["auth_config", 0, "auth_type"],
      "values": ["AUTH_TYPE_UNSPECIFIED"],
      "policy_type": "blacklist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
