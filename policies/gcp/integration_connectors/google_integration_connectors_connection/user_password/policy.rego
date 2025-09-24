package terraform.gcp.security.integration_connectors.google_integration_connectors_connection.user_password
import data.terraform.gcp.helpers
import data.terraform.gcp.security.integration_connectors.google_integration_connectors_connection.vars

conditions := [
  {
    "situation_description": "Check if password is coming from Google Secret Manager",
    "remedies": ["Use secret_version reference"],
  },
  {
    "condition": "Password must come from Secret Manager",
    "attribute_path": ["password","0","secret_version"],
    "values": ["google_secret_manager_secret_version.secret-version.name"],
    "policy_type": "whitelist",
  }
]
message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details

