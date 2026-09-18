package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool_version.tool_open_api_spec_authentication_bearer_token_config_token

import data.terraform.helpers as helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool_version.vars as vars

conditions := [[
  {
    "situation_description": "Dialogflow CX Tool Version must not store a bearer token directly in Terraform configuration.",
    "remedies": ["Use secret_version_for_token or a dynamic session parameter instead of setting token directly."],
  },
  {
    "condition": "token must not contain a plaintext bearer credential.",
    "attribute_path": ["tool", 0, "open_api_spec", 0, "authentication", 0, "bearer_token_config", 0, "token"],
    "values": [""],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details