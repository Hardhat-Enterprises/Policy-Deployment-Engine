package terraform.gcp.security.API.IAM_Gateway_Config.Member

import data.terraform.gcp.helpers
import data.terraform.gcp.security.API.IAM.Member.vars

conditions := [
  [  # wrap this in a nested array
    {
      "situation_description": "Ensure only approved IAM members are added.",
      "remedies": ["Restrict IAM access to allowed users only."]
    },
    {
      "condition": "Disallow any non-approved IAM members",
      "attribute_path": ["member"],
      "values": ["user:user@gmail.com"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
