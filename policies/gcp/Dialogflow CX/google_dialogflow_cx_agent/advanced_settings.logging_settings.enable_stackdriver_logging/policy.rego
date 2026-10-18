package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_agent.advanced_settings_logging_settings_enable_stackdriver_logging

import data.terraform.helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_agent.vars

conditions := [[
  {
    "situation_description": "Google Cloud Logging must be enabled for Dialogflow CX Agent activity.",
    "remedies": ["Set advanced_settings.logging_settings.enable_stackdriver_logging to true."],
  },
  {
    "condition": "Google Cloud Logging must be enabled.",
    "attribute_path": ["advanced_settings", 0, "logging_settings", 0, "enable_stackdriver_logging"],
    "values": [true],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
