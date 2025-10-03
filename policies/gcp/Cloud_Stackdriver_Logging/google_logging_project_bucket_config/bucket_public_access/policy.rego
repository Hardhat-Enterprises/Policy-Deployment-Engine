package terraform.gcp.security.Cloud_Stackdriver_Logging.google_logging_project_bucket_config.bucket_public_access

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Stackdriver_Logging.google_logging_project_bucket_config.vars

conditions := [
    {
        "situation_description": "Custom logging buckets may have public access risks if not properly configured.",
        "remedies": ["Use default logging buckets when possible", "Ensure custom buckets have proper IAM restrictions"],
        "condition": "Avoid custom logging bucket names",
        "attribute_path": ["bucket_id"],
        "values": ["_Default", "_Required"], 
        "policy_type": "blacklist"
    }
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details