package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool_version.tool_open_api_spec_authentication_oauth_config_oauth_grant_type

import data.terraform.helpers as helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool_version.vars as vars

conditions := [[
  {
    "situation_description": "Dialogflow CX OAuth configuration uses an unspecified OAuth grant type.",
    "remedies": ["Set oauth_grant_type to CLIENT_CREDENTIAL."],
  },
  {
    "condition": "oauth_grant_type must be explicitly configured.",
    "attribute_path": ["tool", 0, "open_api_spec", 0, "authentication", 0, "oauth_config", 0, "oauth_grant_type"],
    "values": ["CLIENT_CREDENTIAL"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details