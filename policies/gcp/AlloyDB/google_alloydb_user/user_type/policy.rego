package terraform.gcp.security.alloydb.google_alloydb_user.user_type

import data.terraform.helpers as helpers
import data.terraform.gcp.security.alloydb.google_alloydb_user.vars as vars

conditions := [
  [
    {
      "situation_description": "AlloyDB database users must use IAM-based authentication (avoid password-based built-in users).",
      "remedies": [
        "Set user_type to ALLOYDB_IAM_USER.",
        "Enable IAM authentication on the instance and grant the required IAM roles for database access."
      ],
    },
    {
      "condition": "user_type must be ALLOYDB_IAM_USER.",
      "attribute_path": ["user_type"],
      "values": ["ALLOYDB_IAM_USER"],
      "policy_type": "whitelist",
    },
  ],
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
