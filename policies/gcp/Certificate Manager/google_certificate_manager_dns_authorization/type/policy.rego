package terraform.gcp.security.certificate_manager.google_certificate_manager_dns_authorization.type

import data.terraform.helpers
import data.terraform.gcp.security.certificate_manager.google_certificate_manager_dns_authorization.vars as vars

conditions := [
    [
        {
            "situation_description": "When a DNS authorization uses a non-approved authorization type, certificate validation records may be managed in a way that does not align with project-level separation requirements.",
            "remedies": [
                "Use the approved DNS authorization type for Certificate Manager DNS authorization resources."
            ]
        },
        {
            "condition": "DNS authorization resources should use the approved authorization type.",
            "attribute_path": ["type"],
            "values": ["PER_PROJECT_RECORD", "FIXED_RECORD"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details
