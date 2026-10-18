package terraform.gcp.security.compute_engine.google_compute_instance_template.shielded_instance_config_enable_secure_boot

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_template.vars

conditions := [
    [
        {
            "situation_description": "The instance template does not have Secure Boot enabled (shielded_instance_config.enable_secure_boot is not true), leaving the boot process unverified against unsigned or malicious components",
            "remedies": ["Set shielded_instance_config.enable_secure_boot to true (Secure Boot defaults to false and must be explicitly enabled)"]
        },
        {
            "condition": "shielded_instance_config.enable_secure_boot must be true",
            "attribute_path": ["shielded_instance_config", 0, "enable_secure_boot"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details