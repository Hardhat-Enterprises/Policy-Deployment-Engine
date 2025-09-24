package terraform.gcp.security.Cloud_Stackdriver_Logging.google_logging_project_exclusion.exclusion_filter_policy

import data.terraform.gcp.helpers
import data.terraform.gcp.security.Cloud_Stackdriver_Logging.google_logging_project_exclusion.vars

conditions := [
    
    # Filter content security - prevent overly broad exclusions
  [
    {
        "situation_description": "Logging exclusion filter is too broad, potentially excluding security-critical logs.",
        "remedies": ["Avoid overly broad filters that could exclude security-relevant logs"]
    },
    {
        "condition": "Exclusion filter should not be overly broad",
        "attribute_path": ["filter"],
        "values": ["severity<ERROR", "severity<WARNING", "*"],
        "policy_type": "blacklist"
    }
]
]

message := helpers.get_multi_summary(conditions, vars.exclusion_variables).message
details := helpers.get_multi_summary(conditions, vars.exclusion_variables).details

summary := {
    "message": message,
    "details": details
}