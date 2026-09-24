package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_agent.location

import data.terraform.helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_agent.vars

conditions := [[
  {
    "situation_description": "Dialogflow CX Agent data must be hosted in an approved region.",
    "remedies": ["Set location to an approved Australian region."],
  },
  {
    "condition": "Location must be an approved Australian region.",
    "attribute_path": ["location"],
    "values": ["australia-southeast1"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
