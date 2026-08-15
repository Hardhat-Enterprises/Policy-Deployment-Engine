package terraform.gcp.security.memcache.google_memcache_instance.region

import data.terraform.helpers
import data.terraform.gcp.security.memcache.google_memcache_instance.vars

conditions := [
    [
        {
            "situation_description": "Memcache instance region is outside approved Australian regions.",
            "remedies": [
                "Set region to australia-southeast1 (Sydney).",
                "Set region to australia-southeast2 (Melbourne)."
            ]
        },
        {
            "condition": "region must be an approved Australian region",
            "attribute_path": ["region"],
            "values": ["australia-southeast1", "australia-southeast2"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details