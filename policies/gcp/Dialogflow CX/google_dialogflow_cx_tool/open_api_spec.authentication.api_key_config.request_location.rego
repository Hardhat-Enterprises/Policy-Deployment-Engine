package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool.open_api_spec_authentication_api_key_config_request_location

import data.terraform.helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool.vars

conditions := [
  [
    {
      "situation_description": "Dialogflow CX Tool API keys must be sent in headers rather than query strings.",
      "remedies": ["Set request_location to HEADER to reduce API-key leakage through URLs, proxies, and request logs."]
    },
    {
      "condition": "request_location must be HEADER",
      "attribute_path": ["open_api_spec", 0, "authentication", 0, "api_key_config", 0, "request_location"],
      "values": ["HEADER"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
