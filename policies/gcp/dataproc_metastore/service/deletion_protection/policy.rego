package terraform.gcp.security.dataproc_metastore.service.deletion_protection
import data.terraform.helpers
import data.terraform.gcp.security.dataproc_metastore.service.vars


conditions := [
[
  {
    "situation_description": "Metastore is not protected against accidental deletions.",
    "remedies": ["Turn on deletion protection to prevent this"],
  },
  {
    "condition": "Check if the metastore is protected against accidental deletion.",
    "attribute_path": ["deletion_protection"],
    "values": [true],
    "policy_type": "whitelist"
  }
]
]


message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details