package terraform.gcp.security.cloud_storage.anywhere_cache.ttl_range

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_storage.anywhere_cache.vars

conditions := [
    [
        {
            "situation_description": "TTL is outside the allowed range (3600s to 86400s).",
            "remedies": ["Set TTL between 1 hour (3600s) and 24 hours (86400s)."]
        },
        {
            "condition": "TTL range must be enforced",
            "attribute_path": ["ttl"],
            "values": [3600, 86400],
            "policy_type": "range"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
