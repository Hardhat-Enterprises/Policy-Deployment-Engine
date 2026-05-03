package terraform.gcp.security.Cloud_IAM.google_iam_access_boundary_policy.name_validation

import data.terraform.helpers
import data.terraform.gcp.security.Cloud_IAM.google_iam_access_boundary_policy.vars

# STEP 2: CREATE SCENARIOS
conditions := [

  # ✅ Scenario 1: Naming convention
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

  # ✅ Scenario 2: Weak keyword detection (FIXED)
  [
    {
      "situation_description": "Policy name must not contain weak keywords",
      "remedies": [
        "Avoid using words like test, temp, demo"
      ]
    },
    {
      "condition": "Disallow weak keywords",
      "attribute_path": ["name"],
      "values": [".*(test|temp|demo).*"],
      "policy_type": "pattern blacklist"
    }
  ]
]

# ✅ IMPORTANT FIX: ensure resources are always mentioned
result := helpers.get_multi_summary(conditions, vars.variables)

message := sprintf(
  "%s | Checked Resources: %v",
  [result.message, helpers.get_all_resource_names(vars.variables)]
)

details := result.details