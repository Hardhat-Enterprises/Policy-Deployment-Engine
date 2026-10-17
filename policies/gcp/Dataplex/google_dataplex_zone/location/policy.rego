package terraform.gcp.security.dataplex.google_dataplex_zone.location

import data.terraform.helpers
import data.terraform.gcp.security.dataplex.google_dataplex_zone.vars

conditions := [
    [
        {
            "situation_description": "If the location of the 'Dataplex' Zone is not set to 'australia-southeast1', it is considered non-compliant.",
            "remedies": ["Set the 'location' attribute to 'australia-southeast1'."]
        },
        {
            "condition": "check if the location attribute is set to 'australia-southeast1'",
            "attribute_path": ["location"],
            "values": ["australia-southeast1"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details