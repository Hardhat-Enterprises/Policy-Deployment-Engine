package terraform.gcp.security.Cloud_IAM.google_iam_deny_policy.name_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_deny_policy.vars

conditions := [

  [
    {
      "situation_description": "Deny policy name must not be empty",
      "remedies": [
        "Provide a valid deny policy name"
      ]
    },
    {
      "condition": "Name must be present",
      "attribute_path": ["name"],
      "values": ["^.+$"],
      "policy_type": "pattern whitelist"
    }
  ],

  [
    {
      "situation_description": "Deny policy name must follow required naming convention",
      "remedies": [
        "Start with 'pde-' prefix",
        "Use only lowercase letters, numbers, and hyphens",
        "Do not end with a hyphen",
        "Keep length between 6 and 63 characters"
      ]
    },
    {
      "condition": "Strict deny policy name validation",
      "attribute_path": ["name"],
      "values": [
        "^pde-[a-z0-9]([a-z0-9-]{4,61}[a-z0-9])$"
      ],
      "policy_type": "pattern whitelist"
    }
  ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details