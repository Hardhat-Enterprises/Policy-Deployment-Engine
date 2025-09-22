package terraform.gcp.security.scc.mute_config.parent

import data.terraform.gcp.helpers
import data.terraform.gcp.security.scc.mute_config.vars

conditions := [
  [
    {
      "situation_description": "Mute Config must be scoped only to the approved organization.",
      "remedies": [
        "Set parent to organizations/123456789"
      ]
    },
    {
      "condition": "Check if parent matches the approved organization",
      "attribute_path": ["parent"],
      "values": ["organizations/123456789"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
