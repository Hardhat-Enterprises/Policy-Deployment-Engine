package terraform.gcp.security.secret_version.deletion_policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secretmanager.secret_version.vars

conditions := [
  [
    {
      "situation_description": "Secret version has an unsafe deletion policy",
      "remedies": ["Use DISABLE or ABANDON instead of DELETE to allow safer version deactivation"]
    },
    {
      "condition": "Deletion policy must be one of the safer options",
      "attribute_path": ["deletion_policy"],
      "values": ["DISABLE", "ABANDON"],
      "policy_type": "whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
