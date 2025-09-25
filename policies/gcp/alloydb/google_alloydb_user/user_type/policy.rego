package terraform.gcp.security.alloydb.google_alloydb_user.user_type

import data.terraform.gcp.helpers as helpers
import data.terraform.gcp.security.alloydb.google_alloydb_user.vars as vars

conditions := [
  [
    {
      "situation_description": "AlloyDB user must use IAM authentication.",
      "remedies": ["Set user_type to ALLOYDB_IAM_USER.", "Prefer IAM users for centralized auth and audit."]
    },
    {
      "condition": "user_type must be ALLOYDB_IAM_USER.",
      "attribute_path": ["user_type"],
      "values": ["ALLOYDB_IAM_USER"],
      "policy_type": "whitelist"
    }
  ],
  [
    {
      "situation_description": "user_type must be explicitly set.",
      "remedies": ["Specify user_type as ALLOYDB_IAM_USER."]
    },
    {
      "condition": "user_type must be provided.",
      "attribute_path": ["user_type"],
      "values": [null, ""],
      "policy_type": "blacklist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
