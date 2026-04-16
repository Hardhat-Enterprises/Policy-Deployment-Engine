package terraform.gcp.security.cloud_domains.google_clouddomains_registration.mandatory_labels

import data.terraform.helpers
import data.terraform.gcp.security.cloud_domains.google_clouddomains_registration.vars

conditions := [
    [
        {
            "situation_description": "Cloud Domain registration is missing mandatory labels 'env' and 'owner'.",
            "remedies": ["Add 'env' and 'owner' labels to the 'labels' block."]
        },
        {
            "condition": "Check for mandatory env label",
            "attribute_path": ["labels", "env"],
            "values": [null],
            "policy_type": "blacklist"
        },
        {
            "condition": "Check for mandatory owner label",
            "attribute_path": ["labels", "owner"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
