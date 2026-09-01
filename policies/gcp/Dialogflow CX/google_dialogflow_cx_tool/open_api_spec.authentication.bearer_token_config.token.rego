package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool.open_api_spec_authentication_bearer_token_config_token

import data.terraform.helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool.vars

conditions := [
  [
    {
      "situation_description": "Dialogflow CX Tool bearer tokens must not be stored inline in Terraform configuration or state.",
      "remedies": ["Remove token and use secret_version_for_token with a Secret Manager version."]
    },
    {
      "condition": "token must be empty when Secret Manager is used",
      "attribute_path": ["open_api_spec", 0, "authentication", 0, "bearer_token_config", 0, "token"],
      "values": [null, ""],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
