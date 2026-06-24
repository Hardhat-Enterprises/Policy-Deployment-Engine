package terraform.gcp.security.integration_connectors.google_integration_connectors_connection.ssl_config_use_ssl
import data.terraform.helpers
import data.terraform.gcp.security.integration_connectors.google_integration_connectors_connection.vars

conditions := [
  {
    "situation_description": "Check if SSL is enforced",
    "remedies": ["Must enforce true value for use_ssl"],
  },
  {
    "condition": "Password must come from Secret Manager",
    "attribute_path": ["ssl_config",0,"use_ssl"],
    "values": ["true"],
    "policy_type": "whitelist",
  }
]
message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details