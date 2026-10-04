package terraform.gcp.security.compute_engine.google_compute_instance_template.shielded_instance_config_enable_integrity_monitoring

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_template.vars

conditions := [
    [
        {
            "situation_description": "The instance template has integrity monitoring disabled (shielded_instance_config.enable_integrity_monitoring is not true), so unauthorized boot-chain modifications will not be detected against the baseline",
            "remedies": ["Set shielded_instance_config.enable_integrity_monitoring to true (defaults to true but can be explicitly disabled)"]
        },
        {
            "condition": "shielded_instance_config.enable_integrity_monitoring must be true",
            "attribute_path": ["shielded_instance_config", 0, "enable_integrity_monitoring"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details