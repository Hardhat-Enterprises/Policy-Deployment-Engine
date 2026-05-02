package terraform.gcp.security.Cloud_IAM.google_iam_access_boundary_policy.name_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_access_boundary_policy.vars

conditions := [

  #format validation
  [
    {
      "situation_description": "Policy name must follow secure naming convention",
      "remedies": [
        "Start with 'pde-'",
        "Use only lowercase letters, numbers, and hyphens",
        "Length must be between 6 and 63 characters",
        "Do not end with hyphen"
      ]
    },
    {
      "condition": "Validate naming format",
      "attribute_path": ["name"],
      "values": ["^pde-[a-z0-9-]{3,59}[a-z0-9]$"],
      "policy_type": "pattern whitelist"
    }
  ],

  #Block weak names
  [
    {
      "situation_description": "Policy name must not contain weak or temporary keywords",
      "remedies": [
        "Avoid using words like test, temp, demo",
        "Use meaningful production-ready names"
      ]
    },
    {
      "condition": "Disallow weak keywords",
      "attribute_path": ["name"],
      "values": ["test", "temp", "demo"],
      "policy_type": "blacklist"
    }
  ]

]

result  := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details