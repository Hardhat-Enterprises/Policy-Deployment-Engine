package terraform.gcp.security.scc.mute_config.filter

import data.terraform.gcp.helpers
import data.terraform.gcp.security.scc.mute_config.vars

conditions := [
  [
    {
      "situation_description": "Mute Config must use the approved filter.",
      "remedies": [
        "Set filter to category=\"OS_VULNERABILITY\""
      ]
    },
    {
      "condition": "Check if filter is approved",
      "attribute_path": ["filter"],
      "values": ["category=\"OS_VULNERABILITY\""],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
