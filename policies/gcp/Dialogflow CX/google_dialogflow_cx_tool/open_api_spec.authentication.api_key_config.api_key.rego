package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool.open_api_spec_authentication_api_key_config_api_key

import data.terraform.helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool.vars

conditions := [
  [
    {
      "situation_description": "Dialogflow CX Tool API keys must not be stored inline in Terraform configuration or state.",
      "remedies": ["Remove api_key and use secret_version_for_api_key with a Secret Manager version."]
    },
    {
      "condition": "api_key must be empty when Secret Manager is used",
      "attribute_path": ["open_api_spec", 0, "authentication", 0, "api_key_config", 0, "api_key"],
      "values": [null, ""],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
