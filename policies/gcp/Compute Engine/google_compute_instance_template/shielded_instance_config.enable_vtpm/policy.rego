package terraform.gcp.security.compute_engine.google_compute_instance_template.shielded_instance_config_enable_vtpm

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_template.vars

conditions := [
    [
        {
            "situation_description": "The instance template has the virtual Trusted Platform Module (vTPM) disabled (shielded_instance_config.enable_vtpm is not true), removing secure storage for boot integrity keys and disabling integrity monitoring",
            "remedies": ["Set shielded_instance_config.enable_vtpm to true (defaults to true but can be explicitly disabled)"]
        },
        {
            "condition": "shielded_instance_config.enable_vtpm must be true",
            "attribute_path": ["shielded_instance_config", 0, "enable_vtpm"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details