package terraform.gcp.security.cloud_StackdriverLogging.google_logging_metric.security_events

import data.terraform.helpers
import data.terraform.gcp.security.cloud_StackdriverLogging.google_logging_metric.vars

conditions := [
    [
        {
            "situation_description": "Non-security log metrics are not allowed - only security monitoring metrics should be configured",
            "remedies": [
                "Remove non-security metrics: disk-usage-metric, http-requests-metric",
                "Configure only security-related metrics for:",
                "1. IAM role changes",
                "2. Firewall rule changes",
                "3. Storage bucket IAM changes",
                "4. Service account key creation"
            ]
        },
        {
            "condition": "Metric names must not be non-security patterns",
            "attribute_path": ["name"],
            "values": ["disk-usage-metric", "http-requests-metric"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

summary := {
    "message": message,
    "details": details
}