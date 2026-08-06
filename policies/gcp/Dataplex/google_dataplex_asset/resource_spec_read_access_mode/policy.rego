package terraform.gcp.security.dataplex.google_dataplex_asset.resource_spec_read_access_mode

import data.terraform.helpers
import data.terraform.gcp.security.dataplex.google_dataplex_asset.resource_spec_read_access_mode.vars

conditions := [
    [
        {
            "situation_description": "If the resource_spec.read_access_mode attribute is not set to a valid value, the Dataplex asset may have unauthorized access.",
            "remedies": ["Set the resource_spec.read_access_mode attribute to MANAGED."]
        },
        {
            "condition": "check if the resource_spec.read_access_mode attribute is set to a valid value",
            "attribute_path": ["resource_spec", "read_access_mode"],
            "values": ["MANAGED"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details