package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool_version.tool_open_api_spec_authentication_api_key_config_request_location

import data.terraform.helpers as helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool_version.vars as vars

conditions := [[
  {
    "situation_description": "Dialogflow CX API key is configured to be transmitted in the query string.",
    "remedies": ["Set request_location to HEADER."],
  },
  {
    "condition": "API keys must be transmitted using the request header.",
    "attribute_path": ["tool", 0, "open_api_spec", 0, "authentication", 0, "api_key_config", 0, "request_location"],
    "values": ["HEADER"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details