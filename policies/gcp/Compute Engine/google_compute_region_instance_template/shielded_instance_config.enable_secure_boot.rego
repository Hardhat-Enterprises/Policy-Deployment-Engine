package terraform.gcp.security.compute_engine.google_compute_region_instance_template.shielded_instance_config_enable_secure_boot

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_instance_template.vars

conditions := [
    [
        {
            "situation_description": "Secure Boot is not enabled on the regional instance template, allowing unsigned or untrusted boot components to execute.",
            "remedies": [
                "Set shielded_instance_config.enable_secure_boot to true.",
                "Enable Secure Boot to verify trusted boot components.",
                "Review the instance template Shielded VM configuration."
            ]
        },
        {
            "condition": "Check whether Secure Boot is enabled.",
            "attribute_path": ["shielded_instance_config", 0, "enable_secure_boot"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
