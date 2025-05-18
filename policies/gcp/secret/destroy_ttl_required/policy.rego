package terraform.gcp.security.secretmanager.secret.destroy_ttl_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secretmanager.secret.vars

conditions := [
  [
    {
      "situation_description": "Secret is missing version_destroy_ttl, risking immediate destruction of versions",
      "remedies": ["Set 'version_destroy_ttl' (e.g., '2592000s') to delay permanent deletion"]
    },
    {
      "condition": "version_destroy_ttl must be set",
      "attribute_path": ["version_destroy_ttl"],
      "values": [""],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
