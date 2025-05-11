package terraform.gcp.security.secretmanager.secret_version.deletion_policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secretmanager.secret_version.vars

conditions := [
  [
    {
      "situation_description": "Secret version has deletion_policy set to DELETE",
      "remedies": ["Use DISABLE or ABANDON to allow safer version deactivation instead of deletion"]
    },
    {
      "condition": "Disallow deletion_policy = DELETE",
      "attribute_path": ["deletion_policy"],
      "values": ["DELETE"],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
