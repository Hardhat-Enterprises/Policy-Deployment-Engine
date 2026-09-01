package terraform.gcp.security.compute_engine.google_compute_image.guest_os_features_type

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_image.vars

conditions := [
    [
        {
            "situation_description": "The Compute Image enables the MULTI_IP_SUBNET guest OS feature, which can increase network complexity and exposure for VMs created from the image.",
            "remedies": [
                "Remove MULTI_IP_SUBNET unless it has been explicitly approved for the workload."
            ]
        },
        {
            "condition": "MULTI_IP_SUBNET must not be enabled.",
            "attribute_path": ["guest_os_features", "type"],
            "values": ["MULTI_IP_SUBNET"],
            "policy_type": "blacklist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details