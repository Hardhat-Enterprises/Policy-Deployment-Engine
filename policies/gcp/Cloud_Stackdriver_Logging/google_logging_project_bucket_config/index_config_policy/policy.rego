package terraform.gcp.security.Cloud_Stackdriver_Logging.google_logging_project_bucket_config.index_config_policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Stackdriver_Logging.google_logging_project_bucket_config.vars

conditions := [
    [
        {
            "situation_description": "Logging bucket indexes non-approved fields, potentially increasing costs unnecessarily.",
            "remedies": ["Only index fields that are required for security monitoring and compliance purposes"]
        },
        {
            "condition": "Indexed fields should be from approved list",
            "attribute_path": ["index_configs", "*", "field_path"],
            "values": [["timestamp", "severity", "resource.type", "logName", "protoPayload.methodName", "protoPayload.status", "resource.labels.project_id"]],
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "Logging bucket uses non-standard index types.",
            "remedies": ["Use appropriate index types for different field types (STRING, INTEGER, etc.)"]
        },
        {
            "condition": "Index type should be appropriate for field",
            "attribute_path": ["index_configs", "*", "type"],
            "values": [["INDEX_TYPE_UNSPECIFIED", "INDEX_TYPE_STRING", "INDEX_TYPE_INTEGER", "INDEX_TYPE_DOUBLE", "INDEX_TYPE_BOOLEAN", "INDEX_TYPE_TIMESTAMP"]],
            "policy_type": "whitelist"
        }
    ],
    [
        {
            "situation_description": "Logging bucket indexes too many fields, leading to unnecessary costs.",
            "remedies": ["Limit indexed fields to maximum of 10 to control costs"]
        },
        {
            "condition": "Number of indexed fields should be limited",
            "attribute_path": ["index_configs"],
            "values": [10, null],
            "policy_type": "range"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details