package terraform.gcp.security.compute_engine.google_compute_attached_disk.mode

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_attached_disk.vars

conditions := [
    [
        {
            "situation_description": "Attached disks should use read-only access where write access is not required.",
            "remedies": [
                "Set mode to READ_ONLY."
            ]
        },
        {
            "condition": "Attached disk is not configured as read-only.",
            "attribute_path": ["mode"],
            "values": ["READ_ONLY"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details