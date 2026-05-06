package terraform.gcp.security.cloud_tpu.google_tpu_v2_vm.enable_secure_boot

import future.keywords.if
import data.terraform.helpers as helpers
import data.terraform.gcp.security.cloud_tpu.google_tpu_v2_vm.vars

conditions := [
    [
        {
            "situation_description": "Secure Boot is not enabled on the Cloud TPU V2 VM, leaving it vulnerable to boot-level malware and rootkits.",
            "remedies": [
                "Set `shielded_instance_config.enable_secure_boot` to true to enable Secure Boot on the TPU VM."
            ]
        },
        {
            "condition": "Check if Secure Boot is enabled",
            "attribute_path": ["shielded_instance_config", 0, "enable_secure_boot"],
            "values": [false],
            "policy_type": "blacklist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details