package terraform.gcp.security.cloud_domains.google_clouddomains_registration.mandatory_labels

import data.terraform.helpers
import data.terraform.gcp.security.cloud_domains.google_clouddomains_registration.vars

conditions := [
    [
        {
            "situation_description": "Cloud Domain registration is missing mandatory labels",
            "remedies": ["Add mandatory labels such as 'env' and 'owner' to the resource"]
        },
        {
            "condition": "Check if labels are present",
            "attribute_path": ["labels"],
            "values": [null],
            "policy_type": "blacklist"
        }
    ],
    [
        {
            "situation_description": "Cloud Domain registration is missing 'env' label",
            "remedies": ["Add 'env' label to the resource"]
        },
        {
            "condition": "Check if 'env' label exists",
            "attribute_path": ["labels"],
            "values": ["env", ["*"]],
            "policy_type": "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
