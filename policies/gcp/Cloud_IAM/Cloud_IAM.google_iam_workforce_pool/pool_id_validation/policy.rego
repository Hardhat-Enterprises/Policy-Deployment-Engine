package terraform.gcp.security.Cloud_IAM.google_iam_workforce_pool.pool_id_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_workforce_pool.vars

conditions := [
  [
    {
      "situation_description": "Workforce pool ID must be 6–63 chars, lowercase, hyphens allowed, no trailing hyphen",
      "remedies": [
        "Use lowercase letters only",
        "Ensure 6–63 characters",
        "Do not end with hyphen"
      ]
    },
    {
      "condition": "Validate workforce_pool_id format",
      "attribute_path": ["workforce_pool_id"],
      "values": ["^[a-z][a-z0-9-]{4,61}[a-z0-9]$"],
      "policy_type": "pattern whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details