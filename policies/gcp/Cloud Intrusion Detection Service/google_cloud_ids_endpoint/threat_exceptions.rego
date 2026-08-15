package terraform.gcp.security.cloud_intrusion_detection_service.google_cloud_ids_endpoint.threat_exceptions

import data.terraform.helpers
import data.terraform.gcp.security.cloud_intrusion_detection_service.google_cloud_ids_endpoint.vars

conditions := [
    [
        {
            "situation_description": "The IDS endpoint excludes one or more threat IDs from detection. Each exception is a blind spot that silently suppresses real threats.",
            "remedies": [
                "Remove entries from threat_exceptions so all threats are detected and reported.",
                "If an exception is genuinely required, document the justification and get it reviewed rather than leaving it unbounded."
            ]
        },
        {
            "condition": "threat_exceptions must be empty",
            "attribute_path": ["threat_exceptions"],
            "values": [],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details