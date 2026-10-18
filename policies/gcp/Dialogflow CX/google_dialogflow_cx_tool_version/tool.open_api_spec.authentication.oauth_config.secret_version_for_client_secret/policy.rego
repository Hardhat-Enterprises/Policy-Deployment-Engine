package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool_version.tool_open_api_spec_authentication_oauth_config_secret_version_for_client_secret

import data.terraform.helpers as helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool_version.vars as vars

conditions := [[
  {
    "situation_description": "Dialogflow CX OAuth client secret uses a floating Secret Manager version alias.",
    "remedies": ["Use an explicitly pinned numeric Secret Manager version instead of latest."],
  },
 {
  "condition": "secret_version_for_client_secret must not reference the latest alias.",
  "attribute_path": ["tool", 0, "open_api_spec", 0, "authentication", 0, "oauth_config", 0, "secret_version_for_client_secret"],
  "values": ["*/versions/*", [[], ["latest"]]],
  "policy_type": "pattern blacklist",
},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details