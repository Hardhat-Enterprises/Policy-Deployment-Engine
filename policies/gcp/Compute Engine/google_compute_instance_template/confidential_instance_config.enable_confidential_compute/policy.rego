package terraform.gcp.security.compute_engine.google_compute_instance_template.confidential_instance_config_enable_confidential_compute

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_template.vars

conditions := [
    [
        {
            "situation_description": "The instance template does not have Confidential Computing enabled (confidential_instance_config.enable_confidential_compute is not true), leaving data-in-use unencrypted in memory",
            "remedies": ["Set confidential_instance_config.enable_confidential_compute to true and confidential_instance_config.confidential_instance_type to a supported value (SEV, SEV_SNP, or TDX)"]
        },
        {
            "condition": "confidential_instance_config.enable_confidential_compute must be true",
            "attribute_path": ["confidential_instance_config", 0, "enable_confidential_compute"],
            "values": [true],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details