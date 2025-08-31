package terraform.gcp.security.google_cloudfunction.google_cloudfunctions2_function.envvars

import data.terraform.gcp.helpers
import data.terraform.gcp.security.google_cloudfunction.google_cloudfunctions2_function.vars

# Define disallowed keys or patterns
disallowed_keys := [
  "API_KEY",
  "SECRET_KEY",
  "PRIVATE_KEY",
  "ACCESS_TOKEN",
  "DB_PASSWORD"
]

conditions := [
  [
    {
      "situation_description": "Function defines environment variables that may contain secrets or sensitive data.",
      "remedies": [
        "Avoid using sensitive keys like 'API_KEY' or 'DB_PASSWORD' in environment variables.",
        "Use Secret Manager or encrypted storage for sensitive values."
      ]
    },
    {
      "condition": "Environment variable keys must not match known sensitive patterns.",
      "attribute_path": ["environment_variables"],
      "values": disallowed_keys,
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details