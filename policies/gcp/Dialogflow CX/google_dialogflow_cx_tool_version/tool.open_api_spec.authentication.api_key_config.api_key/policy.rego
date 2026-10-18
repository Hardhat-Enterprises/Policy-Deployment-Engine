package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool_version.tool_open_api_spec_authentication_api_key_config_api_key

import data.terraform.helpers as helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool_version.vars as vars

conditions := [[
  {
    "situation_description": "Dialogflow CX Tool Version must not store an API key directly in Terraform configuration.",
    "remedies": ["Use secret_version_for_api_key instead of setting api_key directly."],
  },
  {
  "condition": "API key must not be stored directly in Terraform configuration.",
  "attribute_path": ["tool", 0, "open_api_spec", 0, "authentication", 0, "api_key_config", 0, "api_key"],
  "values": ["", null],
  "policy_type": "whitelist",
},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details