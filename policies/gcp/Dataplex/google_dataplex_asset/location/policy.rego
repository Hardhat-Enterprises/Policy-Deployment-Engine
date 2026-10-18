package terraform.gcp.security.dataplex.google_dataplex_asset.location

import data.terraform.helpers
import data.terraform.gcp.security.dataplex.google_dataplex_asset.vars

conditions := [
    [
        {
            "situation_description": "If the location attribute is not set to a valid location, the Dataplex asset may be created in an unauthorized or unsupported region.",
            "remedies": ["Set the location attribute to a valid value."]
        },
        {
            "condition": "check if the location attribute is set to a valid location",
            "attribute_path": ["location"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details