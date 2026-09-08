package terraform.gcp.security.cloud_storage.google_storage_bucket.labels

import data.terraform.helpers
import data.terraform.gcp.security.cloud_storage.google_storage_bucket.vars

conditions := [
    [
        {
            "situation_description": "Bucket must carry an 'environment' label naming a real environment.",
            "remedies": ["Set labels.environment to prod, staging or dev."]
        },
        {
            "condition": "Label environment must name a known environment.",
            "attribute_path": ["labels", "environment"],
            "values": ["prod", "staging", "dev"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
