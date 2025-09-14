package terraform.gcp.security.dataform.google_dataform_repository.deletion_policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository.vars

conditions := [
  [
    {"situation_description": "FORCE deletion risks accidental data loss.",
     "remedies": [
       "Set deletion_policy to DELETE.",
       "Require explicit/manual cleanup for child resources."
     ]},
    {"condition": "Blacklist FORCE deletion policy",
     "attribute_path": ["deletion_policy"],
     "values": ["FORCE"],
     "policy_type": "blacklist"}
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
