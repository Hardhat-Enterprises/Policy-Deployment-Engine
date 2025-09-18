package terraform.gcp.security.dataform.google_dataform_repository.service_account_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.dataform.google_dataform_repository.vars

conditions := [
  [
    {"situation_description": "Repository must declare a dedicated service account for workflow invocations.",
     "remedies": [
       "Set service_account to a dedicated identity (e.g., SA per env).",
       "Harden IAM on that service account with least privilege."
     ]},
    {"condition": "Service account must not be null",
     "attribute_path": ["service_account"],
     "values": [null],
     "policy_type": "blacklist"}
  ],
  [
    {"situation_description": "Repository must declare a dedicated service account for workflow invocations.",
     "remedies": [
       "Set service_account to a dedicated identity (e.g., SA per env).",
       "Harden IAM on that service account with least privilege."
     ]},
    {"condition": "Service account must not be empty",
     "attribute_path": ["service_account"],
     "values": [""],
     "policy_type": "blacklist"}
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
