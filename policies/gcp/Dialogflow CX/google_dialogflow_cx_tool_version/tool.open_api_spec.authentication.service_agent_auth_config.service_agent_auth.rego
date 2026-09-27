package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool_version.tool_open_api_spec_authentication_service_agent_auth_config_service_agent_auth

import data.terraform.helpers as helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool_version.vars as vars

conditions := [[
  {
    "situation_description": "Dialogflow CX Tool Version must use an approved service agent authentication token type.",
    "remedies": ["Set service_agent_auth to ID_TOKEN."],
  },
  {
    "condition": "service_agent_auth must use an approved token type.",
    "attribute_path": ["tool", 0, "open_api_spec", 0, "authentication", 0, "service_agent_auth_config", 0, "service_agent_auth"],
    "values": ["ID_TOKEN"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
