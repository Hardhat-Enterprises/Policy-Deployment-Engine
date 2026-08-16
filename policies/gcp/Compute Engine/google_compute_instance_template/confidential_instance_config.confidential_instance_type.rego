package terraform.gcp.security.compute_engine.google_compute_instance_template.confidential_instance_config_confidential_instance_type

import data.terraform.helpers
import data.terraform.gcp.security.compute_engine.google_compute_instance_template.vars

conditions := [
    [
        {
            "situation_description": "The instance template's confidential_instance_config.confidential_instance_type is not set to a supported confidential computing technology",
            "remedies": ["Set confidential_instance_config.confidential_instance_type to one of the supported values: SEV, SEV_SNP, or TDX"]
        },
        {
            "condition": "confidential_instance_config.confidential_instance_type must be SEV, SEV_SNP, or TDX",
            "attribute_path": ["confidential_instance_config", 0, "confidential_instance_type"],
            "values": ["SEV", "SEV_SNP", "TDX"],
            "policy_type": "whitelist"
        }
    ]
]

result := helpers.get_multi_summary(conditions, vars.variables)
message := result.message
details := result.details