package terraform.gcp.security.compute_engine.google_compute_image.storage_locations

import data.terraform.helpers

import data.terraform.gcp.security.compute_engine.google_compute_image.vars

conditions := [
    [
        {
            "situation_description": "The Compute Image does not explicitly specify a storage location, which can make data residency and availability requirements harder to enforce.",
            "remedies": [
                "Set storage_locations to at least one appropriate regional or multi-regional storage location."
            ]
        },
        {
            "condition": "storage_locations must contain at least one explicitly configured location.",
            "attribute_path": ["storage_locations"],
            "values": [null, []],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message

details := helpers.get_multi_summary(conditions, vars.variables).details