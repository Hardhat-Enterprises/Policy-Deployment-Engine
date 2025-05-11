package terraform.gcp.security.sql.database_instance.deletion_protection

import data.terraform.gcp.helpers
import data.terraform.gcp.security.sql.database_instance.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
  [
    {
      "situation_description": "Cloud SQL instances should have deletion protection enabled to prevent accidental deletion.",
      "remedies": [
        "Set `deletion_protection = true` in the resource block to enable deletion protection."
      ]
    },
    {
      "condition": "Checks if deletion protection is set to true",
      "attribute_path": ["deletion_protection"],
      "values": [true],
      "policy_type": "whitelist"
    }
  ]
]

# Displays a general message about policy compliance
# Use 'opa eval ... "data.terraform.gcp.security.sql.database_instance.deletion_protection.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
# Use 'opa eval ... "data.terraform.gcp.security.sql.database_instance.deletion_protection.details"
details := helpers.get_multi_summary(conditions, vars.variables).details