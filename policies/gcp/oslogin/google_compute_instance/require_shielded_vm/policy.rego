package terraform.gcp.security.oslogin.google_compute_instance.require_shielded_vm

import data.terraform.helpers
import data.terraform.gcp.security.oslogin.google_compute_instance.vars

conditions := [
    [
        {
            "situation_description": "Instances with OS Login must use Shielded VM Secure Boot",
            "remedies": [
                "Enable shielded_instance_config.enable_secure_boot = TRUE"
            ]
        },
        {
            "condition": "Shielded VM secure boot must be enabled",
            "attribute_path": ["shielded_instance_config", 0, "enable_secure_boot"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

message := helpers.get_multi_summary(conditions, vars.variables).message
details := helpers.get_multi_summary(conditions, vars.variables).details

