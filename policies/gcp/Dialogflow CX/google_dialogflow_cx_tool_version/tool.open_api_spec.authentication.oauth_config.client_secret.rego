package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool_version.tool_open_api_spec_authentication_oauth_config_client_secret

import data.terraform.helpers as helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool_version.vars as vars

conditions := [[
  {
    "situation_description": "Dialogflow CX Tool Version must not store an OAuth client secret directly in Terraform configuration.",
    "remedies": ["Use secret_version_for_client_secret instead of setting client_secret directly."],
  },
  {
    "condition": "client_secret must not contain a plaintext credential.",
    "attribute_path": ["tool", 0, "open_api_spec", 0, "authentication", 0, "oauth_config", 0, "client_secret"],
    "values": [""],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details