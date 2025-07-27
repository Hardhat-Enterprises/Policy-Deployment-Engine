package terraform.gcp.security.cloud_storage.bucket.name_pattern_blacklist

import data.terraform.gcp.helpers
import data.terraform.gcp.security.cloud_storage.bucket.vars

conditions := [
    [
        {
            "situation_description": "Bucket name contains restricted keywords.",
            "remedies": ["Avoid using 'test' or 'dev' in bucket names."]
        },
        {
            "condition": "Name should not contain blacklisted keywords.",
            "attribute_path": ["name"],
            "values": ["*test*", [["test"], ["dev"]]],
            "policy_type": "pattern blacklist"
        }
    ]
]

summary := helpers.get_multi_summary(conditions, vars.variables)

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
