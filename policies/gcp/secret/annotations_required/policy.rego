package terraform.gcp.security.secret.annotations_required

import data.terraform.gcp.helpers
import data.terraform.gcp.security.secret.vars

conditions := [
  [
    {
      "situation_description": "Secret is missing the required annotation 'created_by'",
      "remedies": [
        "Ensure 'created_by' is annotated with a known value like 'aadi@example.com'"
      ]
    },
    {
      "condition": "created_by must be set to an approved value",
      "attribute_path": ["annotations", "created_by"],
      "values": ["aadi@example.com"],
      "policy_type": "pattern whitelist"
    }
  ],
  [
    {
      "situation_description": "Secret is missing the required annotation 'env'",
      "remedies": [
        "Ensure 'env' is annotated with an approved value such as 'production'"
      ]
    },
    {
      "condition": "env must be set to an approved value",
      "attribute_path": ["annotations", "env"],
      "values": ["production"],
      "policy_type": "pattern whitelist"
    }
  ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
