package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool_version.tool_open_api_spec_authentication_oauth_config_scopes

import data.terraform.helpers as helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool_version.vars as vars

conditions := [[
  {
    "situation_description": "Dialogflow CX Tool Version OAuth configuration uses an overly broad OAuth scope.",
    "remedies": ["Use a more restrictive OAuth scope that follows least privilege."],
  },
  {
    "condition": "OAuth scopes must not contain the unrestricted cloud-platform scope.",
    "attribute_path": ["tool", 0, "open_api_spec", 0, "authentication", 0, "oauth_config", 0, "scopes"],
    "values": ["https://www.googleapis.com/auth/cloud-platform"],
    "policy_type": "element blacklist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details