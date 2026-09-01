package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_agent.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_agent.vars

conditions := [[
  {
    "situation_description": "Dialogflow CX Agents must be protected from accidental deletion.",
    "remedies": ["Set deletion_policy to PREVENT."],
  },
  {
    "condition": "Deletion policy must prevent destruction.",
    "attribute_path": ["deletion_policy"],
    "values": ["PREVENT"],
    "policy_type": "whitelist",
  },
]]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
