package terraform.gcp.security.Cloud_Stackdriver_Logging.exclusion_policy.disable_exclusion

import data.terraform.gcp.helpers
import data.terraform.gcp.security.logging.vars

conditions := [
     # Disabled exclusions requirement
    [
        {
            "situation_description": "Logging exclusion is disabled, potentially bypassing security monitoring.",
            "remedies": ["Ensure logging exclusions are enabled (disabled = false) to maintain security visibility"]
        },
        {
            "condition": "Exclusion should not be disabled",
            "attribute_path": ["disabled"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ],
]

# ------------------------------------------------------------
# Compliance messages
# ------------------------------------------------------------
message := helpers.get_multi_summary(conditions, vars.exclusion_variables).message
details := helpers.get_multi_summary(conditions, vars.exclusion_variables).details

# Add this summary rule
summary := {
    "message": message,
    "details": details
}