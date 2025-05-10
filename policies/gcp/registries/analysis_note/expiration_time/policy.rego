package terraform.gcp.security.registries.google_container_analysis_note.expiration_time

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analysis_note.expiration_time.vars

# STEP 1: Define the expiration time range (1 to 365 days)
expiration_time_range := {"lower_bound": 1, "upper_bound": 365}

# STEP 2: Define the conditions for expiration time policy
conditions := [
    [
        {"situation_description": "Expiration time is not within the valid range of 1 to 365 days.",
        "remedies": ["Ensure expiration time is between 1 and 365 days."]},
        {
            "condition": "Check if expiration time is within the valid range",
            "attribute_path": ["expiration_time"],
            "values": [expiration_time_range["lower_bound"], expiration_time_range["upper_bound"]],
            "policy_type": "range"  # Policy type is range since we are checking if the value falls between a defined range.
        }
    ]
]

# STEP 3: Use the helpers to generate a message summarizing the policy evaluation
# Displays a general message about policy compliance
message := helpers.get_multi_summary(conditions, vars.variables).message

# Displays a detailed summary of each resource's compliance to every condition and situation
# Useful for debugging
details := helpers.get_multi_summary(conditions, vars.variables).details
