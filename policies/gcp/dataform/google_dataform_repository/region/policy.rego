package terraform.gcp.security.dataform.google_dataform_repository.region

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository.vars

conditions := [
  [
    {"situation_description": "Repository must be deployed only to approved regions.",
     "remedies": [
       "Set region to an approved location (e.g., australia-southeast1).",
       "Align provisioning to data residency policy."
     ]},
    {"condition": "Region allowlist",
     "attribute_path": ["region"],
     "values": ["australia-southeast1"],
     "policy_type": "whitelist"}
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details