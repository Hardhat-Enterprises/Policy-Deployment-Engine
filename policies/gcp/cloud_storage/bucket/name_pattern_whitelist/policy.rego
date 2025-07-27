package terraform.gcp.security.cloud_storage.bucket.name_pattern_whitelist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_storage.bucket.vars

conditions := [
    [
        {
            "situation_description": "Bucket name does not follow naming convention.",
            "remedies": ["Use names that start with 'project-'"]
        },
        {
            "condition": "Name must match pattern 'project-*'",
            "attribute_path": ["name"],
            "values": ["project-*", [["project"]]],
            "policy_type": "pattern whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
