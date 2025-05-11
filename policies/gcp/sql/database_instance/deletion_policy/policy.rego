package terraform.gcp.security.sql.database.deletion_policy 
import data.terraform.gcp.helpers
import data.terraform.gcp.security.sql.database.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions) )
conditions := [
  [
    {
      "situation_description": "Cloud SQL databases should have a deletion policy explicitly set to avoid accidental deletions.",
      "remedies": [
        "Set `deletion_policy = \"ABANDON\"` or `deletion_policy = \"DELETE\"` in the resource block."
      ]
    },
    {
      "condition": "Checks if deletion_policy is explicitly set to either ABANDON or DELETE",
      "attribute_path": ["deletion_policy"],
      "values": ["ABANDON", "DELETE"],
      "policy_type": "whitelist"
    }
  ]
]

# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resources compliance to every condition and situation
details := helpers.get_multi_summary(conditions, vars.variables).details