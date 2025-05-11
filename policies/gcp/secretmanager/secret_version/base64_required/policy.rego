package terraform.gcp.security.secretmanager.secret_version.base64_required
import data.terraform.gcp.helpers
import data.terraform.gcp.security.secretmanager.secret_version.vars

conditions := [
  [
    {
      "situation_description": "Secret contains binary-like content but is not base64 encoded",
      "remedies": ["Enable base64 encoding with `is_secret_data_base64 = true`"]
    },
    {
      "condition": "Base64 encoding flag must be true for binary secrets",
      "attribute_path": ["is_secret_data_base64"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
