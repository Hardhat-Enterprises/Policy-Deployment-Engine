package terraform.gcp.security.secret.rotation_and_ttl_enforced

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secret.vars

conditions := [
  [
    {
      "situation_description": "Secret is missing rotation configuration",
      "remedies": [
        "Add a valid rotation block with `rotation_period` and `next_rotation_time`"
      ]
    },
    {
      "condition": "rotation block must be present",
      "attribute_path": ["rotation"],
      "values": [""],
      "policy_type": "whitelist"
    }
  ],
  [
    {
      "situation_description": "Secret is missing TTL setting",
      "remedies": [
        "Add a valid `ttl` duration to the secret"
      ]
    },
    {
      "condition": "ttl must be present",
      "attribute_path": ["ttl"],
      "values": [""],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
