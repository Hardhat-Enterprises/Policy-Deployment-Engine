package terraform.gcp.security.api_hub.google_apihub_curation.location

import data.terraform.helpers
import data.terraform.gcp.security.api_hub.google_apihub_curation.vars

conditions := [
    [
        {
            "situation_description": "API Hub curation location is not in the approved Australia region allowlist.",
            "remedies": [
                "Set location to australia-southeast1 or australia-southeast2."
            ]
        },
        {
            "condition": "Location must be on the allowlist",
            "attribute_path": ["location"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
