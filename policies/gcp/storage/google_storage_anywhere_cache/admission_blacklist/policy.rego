package terraform.gcp.security.storage.google_storage_anywhere_cache.admission_blacklist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.storage.google_storage_anywhere_cache.vars

conditions := [
    [
        {
            "situation_description": "Admission policy uses 'admit-on-first-miss', which is disallowed.",
            "remedies": ["Use 'admit-on-second-miss' instead."]
        },
        {
            "condition": "Disallowed admission policy",
            "attribute_path": ["admission_policy"],
            "values": ["admit-on-first-miss"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
