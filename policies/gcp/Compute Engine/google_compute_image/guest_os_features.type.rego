package terraform.gcp.security.compute_engine.google_compute_image.guest_os_features_type

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_image.vars

conditions := [
    [
        {
            "situation_description": "The Compute Image does not include Secure Boot support in its guest OS features.",
            "remedies": [
                "Add SECURE_BOOT to guest_os_features so VMs created from the image can support Secure Boot."
            ]
        },
        {
            "condition": "SECURE_BOOT must be included in guest_os_features.",
            "attribute_path": ["guest_os_features", "type"],
            "values": ["SECURE_BOOT"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details