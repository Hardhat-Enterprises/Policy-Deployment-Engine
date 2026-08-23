package terraform.gcp.security.compute_engine.google_compute_image.family

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_image.vars

conditions := [
    [
        {
            "situation_description": "The Compute Image is assigned to an image family, which can cause deployments to resolve to a newer active image instead of remaining pinned to a specific image.",
            "remedies": [
                "Remove the family setting and reference a specific image when a fixed, predictable image version is required."
            ]
        },
        {
            "condition": "Image family must not be configured.",
            "attribute_path": ["family"],
            "values": [null, ""],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details