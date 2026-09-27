package terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool.deletion_policy

import data.terraform.helpers
import data.terraform.gcp.security.dialogflow_cx.google_dialogflow_cx_tool.vars

conditions := [
  [
    {
      "situation_description": "Dialogflow CX Tools must be protected from accidental deletion.",
      "remedies": ["Set deletion_policy to PREVENT."]
    },
    {
      "condition": "deletion_policy must be PREVENT",
      "attribute_path": ["deletion_policy"],
      "values": ["PREVENT"],
      "policy_type": "whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details
