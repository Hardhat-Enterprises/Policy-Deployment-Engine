package terraform.gcp.security.compute_engine.google_compute_region_instance_template.shielded_instance_config_enable_integrity_monitoring

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_instance_template.vars

conditions := [
    [
        {
            "situation_description": "Integrity monitoring is not enabled on the regional instance template, preventing Shielded VM boot measurements from being checked against the integrity baseline.",
            "remedies": [
                "Set shielded_instance_config.enable_integrity_monitoring to true.",
                "Enable integrity monitoring to evaluate boot measurements against the Shielded VM integrity baseline.",
                "Review the instance template Shielded VM configuration."
            ]
        },
        {
            "condition": "Check whether integrity monitoring is enabled.",
            "attribute_path": ["shielded_instance_config", 0, "enable_integrity_monitoring"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
