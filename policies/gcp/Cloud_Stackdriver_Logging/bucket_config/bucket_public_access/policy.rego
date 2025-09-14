package terraform.gcp.security.Cloud_Stackdriver_Logging.bucket_config.bucket_public_access

import data.terraform.gcp.helpers
import data.terraform.gcp.security.logging.vars

conditions := [
    {
        "situation_description": "Logging bucket has public access enabled, risking exposure of sensitive logs.",
        "remedies": ["Ensure logging buckets never have public access enabled"]
    },
    {
        "condition": "Logging bucket should not have public access",
        "attribute_path": ["bucket_id"],
        "values": [true],
        "policy_type": "blacklist"
    }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

summary := {
    "message": message,
    "details": details
}