package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_agent.enable_stackdriver_logging

import data.terraform.helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_agent.vars

conditions := [[
  {
    "situation_description": "Dialogflow CX Agent conversation-query logging must be enabled for audit visibility.",
    "remedies": ["Set enable_stackdriver_logging to true."],
  },
  {
    "condition": "Conversation-query logging must be enabled.",
    "attribute_path": ["enable_stackdriver_logging"],
    "values": [true],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details