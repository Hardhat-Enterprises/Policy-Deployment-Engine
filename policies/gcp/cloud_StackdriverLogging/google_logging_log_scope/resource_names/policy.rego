package terraform.gcp.security.cloud_StackdriverLogging.google_logging_log_scope.resource_names

import data.terraform.helpers
import data.terraform.gcp.security.cloud_StackdriverLogging.google_logging_log_scope.vars

conditions := [
    [
        {
            "situation_description": "Log scope includes unauthorized projects or excludes critical security projects",
            "remedies": [
                "Only include production projects that require security monitoring",
                "Exclude development, testing, and external projects",
                "Ensure all critical audit projects are included",
                "Maximum 50 projects and 100 total resources"
            ]
        },
        {
            "condition": "Resource names must only include authorized projects",
            "attribute_path": ["resource_names"],
            "values": ["attacker-project", "test-project", "dev-", "-sandbox"],
            "policy_type": "element blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details