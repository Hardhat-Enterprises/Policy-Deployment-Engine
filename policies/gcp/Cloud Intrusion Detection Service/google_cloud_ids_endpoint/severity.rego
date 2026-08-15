package terraform.gcp.security.cloud_intrusion_detection_service.google_cloud_ids_endpoint.severity

import data.terraform.helpers
import data.terraform.gcp.security.cloud_intrusion_detection_service.google_cloud_ids_endpoint.vars

conditions := [
    [
        {
            "situation_description": "The IDS endpoint's minimum alert severity is set too high, so lower-severity threats are silently ignored and never reported.",
            "remedies": [
                "Set severity to INFORMATIONAL or LOW so the endpoint reports the full range of detected threats.",
                "Reserve higher thresholds (MEDIUM, HIGH, CRITICAL) only for cases with a documented, deliberate reason to suppress lower-severity alerts."
            ]
        },
        {
            "condition": "IDS endpoint severity must be INFORMATIONAL or LOW",
            "attribute_path": ["severity"],
            "values": ["INFORMATIONAL", "LOW"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details