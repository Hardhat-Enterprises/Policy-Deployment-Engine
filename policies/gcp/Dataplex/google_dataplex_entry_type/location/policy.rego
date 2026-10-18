package terraform.gcp.security.dataplex.google_dataplex_entry_type.location

import data.terraform.helpers
import data.terraform.gcp.security.dataplex.google_dataplex_entry_type.vars

conditions := [
    [
        {
            "situation_description": "Entry type location is outside approved Australian geolocation/region",
            "remedies": [
            "set location to: australia-southeast1 - Sydney",
            "set location to: australia-southeast2 - Melbourne",
        ]
        },
        {
            "condition": "region must align with Australia's regions.",
            "attribute_path": ["location"],
            "values":  ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
        
    ]
]

result := helpers.get_multi_summary(conditions,vars.variables)
message := result.message
details := result.details

