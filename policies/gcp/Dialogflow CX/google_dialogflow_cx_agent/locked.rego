package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_agent.locked

import data.terraform.helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_agent.vars

conditions := [[
  {
    "situation_description": "Dialogflow CX Agent configuration must be protected from unauthorised changes.",
    "remedies": ["Set locked to true after the agent configuration is approved."],
  },
  {
    "condition": "Agent must be locked.",
    "attribute_path": ["locked"],
    "values": [true],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
