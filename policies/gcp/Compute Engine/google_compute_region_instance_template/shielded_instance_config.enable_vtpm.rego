package terraform.gcp.security.compute_engine.google_compute_region_instance_template.shielded_instance_config_enable_vtpm

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_region_instance_template.vars

conditions := [
    [
        {
            "situation_description": "Virtual TPM is not enabled on the regional instance template, reducing the integrity and attestation protections available to the Shielded VM.",
            "remedies": [
                "Set shielded_instance_config.enable_vtpm to true.",
                "Enable vTPM to provide measured boot and integrity capabilities.",
                "Review the instance template Shielded VM configuration."
            ]
        },
        {
            "condition": "Check whether vTPM is enabled.",
            "attribute_path": ["shielded_instance_config", 0, "enable_vtpm"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)

message := result.message
details := result.details
