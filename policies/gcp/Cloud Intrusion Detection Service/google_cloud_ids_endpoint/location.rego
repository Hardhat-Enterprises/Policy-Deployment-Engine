package terraform.gcp.security.cloud_intrusion_detection_service.google_cloud_ids_endpoint.location

import data.terraform.helpers
import data.terraform.gcp.security.cloud_intrusion_detection_service.google_cloud_ids_endpoint.vars

conditions := [
    [
        {
            "situation_description": "IDS endpoint location is outside the approved Australian region.",
            "remedies": [
                "Set the IDS endpoint location to australia-southeast1.",
                "Use approved Australian regions to support data residency and regional governance requirements."
            ]
        },
        {
            "condition": "IDS endpoint location must be australia-southeast1",
            "attribute_path": ["location"],
            "values": ["australia-southeast1"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details