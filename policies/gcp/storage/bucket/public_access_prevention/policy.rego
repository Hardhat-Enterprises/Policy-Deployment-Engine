package terraform.gcp.security.storage.bucket.public_access_prevention

import data.terraform.gcp.helpers
import data.terraform.gcp.security.storage.bucket.vars

conditions := [
    [
        {
            "situation_description": "Bucket does not have public access prevention enabled.",
            "remedies": ["Set public_access_prevention to 'enforced'"]
        },
        {
            "condition": "Check if public_access_prevention is enforced.",
            "attribute_path": ["public_access_prevention"],
            "values": ["enforced"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
