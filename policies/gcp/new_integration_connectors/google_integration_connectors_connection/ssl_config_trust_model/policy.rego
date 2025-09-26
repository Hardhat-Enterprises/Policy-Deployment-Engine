package terraform.gcp.security.integration_connectors.google_integration_connectors_connection.ssl_config_trust_model
import data.terraform.gcp.helpers
import data.terraform.gcp.security.integration_connectors.google_integration_connectors_connection.vars

conditions := [
  {
    "situation_description": "Check if trust_model is not set to INSECURE",
    "remedies": ["Must not set trust_model to INSECURE"],
  },
  {
    "condition": "trust_model must not be INSECURE",
    "attribute_path": ["ssl_config","0","trust_model"],
    "values": ["INSECURE"],
    "policy_type": "blacklist",
  }
]
message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details