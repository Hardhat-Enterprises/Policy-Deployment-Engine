package terraform.gcp.security.cloud_storage.anywhere_cache.admission_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_storage.anywhere_cache.vars

conditions := [
    [
        {
            "situation_description": "Admission policy is not set to the approved value 'admit-on-second-miss'.",
            "remedies": ["Set 'admission_policy' to 'admit-on-second-miss'."]
        },
        {
            "condition": "Only 'admit-on-second-miss' is allowed for admission_policy",
            "attribute_path": ["admission_policy"],
            "values": ["admit-on-second-miss"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
