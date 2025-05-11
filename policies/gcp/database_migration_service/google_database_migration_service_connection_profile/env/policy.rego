package terraform.gcp.security.dms.connection_profile.env_check

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dms.connection_profile.vars

conditions := [
  [
    {
      "situation_description": "Environment label is not set to 'prod'.",
      "remedies": [
        "Set the label 'env' to 'prod' for production-grade configurations."
      ]
    },
    {
      "condition": "Label 'env' should be 'prod'",
      "attribute_path": ["labels", "env"],
      "values": ["prod"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
