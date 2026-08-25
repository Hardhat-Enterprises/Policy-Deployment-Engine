package terraform.gcp.security.compute_engine.google_compute_disk.guest_os_features_type

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_disk.vars

conditions := [
    [
        {
            "situation_description": "Compute disk does not enable an approved security-relevant guest OS feature such as SECURE_BOOT, which validates boot components against trusted signatures to block rootkits and unsigned boot code.",
            "remedies": ["Add a guest_os_features block with type set to SECURE_BOOT on bootable disks running sensitive workloads."]
        },
        {
            "condition": "guest_os_features.type must include an approved security feature.",
            "attribute_path": ["guest_os_features", 0, "type"],
            "values": ["SECURE_BOOT", "UEFI_COMPATIBLE"],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details