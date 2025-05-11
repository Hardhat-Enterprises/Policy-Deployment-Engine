package terraform.gcp.security.secretmanager.secret_version.destroy_ttl_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secretmanager.secret_version.vars

conditions := [
  [
    {
      "situation_description": "Secret version is missing version_destroy_ttl, risking immediate deletion",
      "remedies": ["Set 'version_destroy_ttl' to delay version destruction (e.g. '2592000s')"]
    },
    {
      "condition": "Check if version_destroy_ttl is not set",
      "attribute_path": ["version_destroy_ttl"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
