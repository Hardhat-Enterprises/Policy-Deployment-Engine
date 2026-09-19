package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool_version.tool_open_api_spec_authentication_oauth_config_token_endpoint

import data.terraform.helpers as helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool_version.vars as vars

conditions := [[
  {
    "situation_description": "Dialogflow CX OAuth token endpoint uses an insecure plaintext HTTP URL.",
    "remedies": ["Use an HTTPS token endpoint."],
  },
  {
  "condition": "token_endpoint must not use plaintext HTTP.",
  "attribute_path": ["tool", 0, "open_api_spec", 0, "authentication", 0, "oauth_config", 0, "token_endpoint"],
  "values": ["*://*", [["http"]]],
  "policy_type": "pattern blacklist",
},
]]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details