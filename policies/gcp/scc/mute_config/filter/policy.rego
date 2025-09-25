package terraform.gcp.security.scc.mute_config.filter

import data.terraform.gcp.helpers
import data.terraform.gcp.security.scc.mute_config.vars

conditions := [
  [
    {
      "situation_description": "Mute config must have a valid filter defined.",
      "remedies": [
        "Ensure the filter field is set to category=\"OS_VULNERABILITY\" only."
      ]
    },
    {
      "condition": "Filter must be in the allowlist",
      "attribute_path": ["filter"],
      "values": [
        "category=\"OS_VULNERABILITY\""
      ],
      "policy_type": "whitelist"
    }
  ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := summary.message
details := summary.details
