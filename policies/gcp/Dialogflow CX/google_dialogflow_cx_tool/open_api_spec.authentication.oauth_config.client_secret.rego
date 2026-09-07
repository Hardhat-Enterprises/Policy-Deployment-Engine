package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool.open_api_spec_authentication_oauth_config_client_secret

import data.terraform.helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool.vars

conditions := [
  [
    {
      "situation_description": "Dialogflow CX Tool OAuth client secrets must not be stored inline in Terraform configuration or state.",
      "remedies": ["Remove client_secret and use secret_version_for_client_secret with a Secret Manager version."]
    },
    {
      "condition": "client_secret must be empty when Secret Manager is used",
      "attribute_path": ["open_api_spec", 0, "authentication", 0, "oauth_config", 0, "client_secret"],
      "values": [null, ""],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
