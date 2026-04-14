package terraform.gcp.security.cloud_StackdriverLogging.google_logging_metric.disabled

import data.terraform.helpers
import data.terraform.gcp.security.cloud_StackdriverLogging.google_logging_metric.vars

conditions := [
    [
        {
            "situation_description": "Security metric is disabled - critical security events will not be monitored",
            "remedies": [
                "Set disabled = false to enable the metric",
                "Remove the disabled attribute entirely (default is false)",
                "Ensure all security metrics remain active for continuous monitoring"
            ]
        },
        {
            "condition": "Security metrics must not be disabled",
            "attribute_path": ["disabled"],
            "values": [true],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details