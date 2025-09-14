package terraform.gcp.security.Cloud_Stackdriver_Logging.exclusion_policy.exclusion_description_policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.logging.vars

conditions := [
    
    # Description requirement for exclusions
  [
    {
        "situation_description": "Logging exclusion missing description.",
        "remedies": ["Add a descriptive explanation for why this exclusion is necessary"]
    },
    {
        "condition": "Exclusion should have a description",
        "attribute_path": ["description"],
        "values": ["", null],  # Catch both empty string and null
        "policy_type": "blacklist"
    }
]

]

message := helpers.get_multi_summary(conditions, vars.exclusion_variables).message
details := helpers.get_multi_summary(conditions, vars.exclusion_variables).details

summary := {
    "message": message,
    "details": details
}