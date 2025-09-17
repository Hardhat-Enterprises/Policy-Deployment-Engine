package terraform.gcp.security.cloud_storage.google_storage_anywhere_cache.zone_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_storage.google_storage_anywhere_cache.vars

conditions := [
    [
        {
            "situation_description": "Cache is created in a zone outside the approved Australian zone.",
            "remedies": ["Use zone 'australia-southeast1-b' only."]
        },
        {
            "condition": "Zone must be whitelisted",
            "attribute_path": ["zone"],
            "values": ["australia-southeast1-b"],
            "policy_type": "whitelist"
        }
    ]
]
summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
