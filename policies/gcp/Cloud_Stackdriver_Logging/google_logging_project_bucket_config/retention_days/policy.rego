package terraform.gcp.security.Cloud_Stackdriver_Logging.google_logging_project_bucket_config.retention_days

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Stackdriver_Logging.google_logging_project_bucket_config.vars

conditions := [
     
    [
        {
            "situation_description": "Logging bucket has insufficient retention period.",
            "remedies": ["Set retention_days to at least 365 days for compliance requirements"]
        },
        {
            "condition": "Retention period should be sufficient",
            "attribute_path": ["retention_days"],
            "values": [365, null], 
            "policy_type": "range"
        }
    ]

]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
