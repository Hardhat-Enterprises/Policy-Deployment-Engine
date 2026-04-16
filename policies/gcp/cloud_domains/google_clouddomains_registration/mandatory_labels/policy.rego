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
            "condition": "Check for mandatory labels",
            "attribute_path": ["labels"],
            "values": ["env", "owner"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
