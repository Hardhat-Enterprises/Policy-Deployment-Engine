package terraform.gcp.security.identity_platform.google_identity_platform_config.monitoring_request_logging_enabled

import data.terraform.helpers
import data.terraform.gcp.security.identity_platform.google_identity_platform_config.vars

conditions := [
    [
        {
            "situation_description": "Identity Platform request logging is disabled.",
            "remedies": [
                "Set monitoring.request_logging.enabled to true to retain audit-relevant request activity."
            ]
        },
        {
            "condition": "Identity Platform request logging must be enabled",
            "attribute_path": ["monitoring",0,"request_logging",0,"enabled"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details

