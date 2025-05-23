package terraform.gcp.security.registries.google_container_analysis_note.expiration_time

import data.terraform.gcp.helpers
import data.terraform.gcp.security.analysis_note.expiration_time.vars

expiration_time_range := {"lower_bound": 1, "upper_bound": 365}

conditions := [
    [
        {"situation_description": "Expiration time is not within the valid range of 1 to 365 days.",
        "remedies": ["Ensure expiration time is between 1 and 365 days."]},
        {
            "condition": "Check if expiration time is within the valid range",
            "attribute_path": ["expiration_time"],
            "values": [expiration_time_range["lower_bound"], expiration_time_range["upper_bound"]],
            "policy_type": "range"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
