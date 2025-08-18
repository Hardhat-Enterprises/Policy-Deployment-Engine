package terraform.gcp.security.public_ca.external_account_key.location_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.public_ca.external_account_key.location_whitelist.vars

# STEP 1: STUDY YOUR RESOURCE AND ITS ATTRIBUTES, THEN FILL IN THE VARS FILE

# STEP 2: CREATE SCENARIOS (can be simple (one condition) or complex (multiple linked conditions))
conditions := [
  [
    {
      "situation_description": "External Account Key is created in a non-approved location.",
      "remedies": [
        "Use an approved location (e.g., us-central1, us-east1, europe-west1)."
      ]
    },
    {
      "condition": "Allow only approved locations (planned_values)",
      "attribute_path": ["location"],  # planned_values.root_module.resources[*].values.location
      "values": ["us-central1", "us-east1", "europe-west1"],
      "policy_type": "whitelist"
    }
  ]
]


# Displays a general message about policy compliance
# Use: opa eval ... "data.terraform.gcp.security.public_ca.external_account_key.location_whitelist.message"
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary for debugging
# Use: opa eval ... "data.terraform.gcp.security.public_ca.external_account_key.location_whitelist.details"
details := helpers.get_multi_summary(conditions, vars.variables).details
