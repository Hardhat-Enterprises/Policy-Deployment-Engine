package terraform.gcp.security.dataplex.google_dataplex_task.location

import data.terraform.helpers
import data.terraform.gcp.security.dataplex.google_dataplex_task.vars

conditions := [
    [
        {
            "situation_description": "Task is outside approved Australian regions",
            "remedies" : [
                "Set location to:",
                "australia-southeast1 - Sydney",
                "australia-southeast2 - Melbourne"
            ]
        },
        {
            "condition": "location must be an approved Australian region",
            "attribute_path": ["location"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

result  := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details