package terraform.gcp.security.compute_engine.google_compute_region_disk.access_mode

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_disk.vars

conditions := [
    [
        {
            "situation_description": "Regional disk access should be limited to a single writer.",
            "remedies": [
                "Set access_mode to READ_WRITE_SINGLE."
            ]
        },
        {
            "condition": "Require single-writer disk access.",
            "attribute_path": ["access_mode"],
            "values": ["READ_WRITE_SINGLE"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details